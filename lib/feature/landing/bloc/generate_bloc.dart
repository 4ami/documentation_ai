import 'dart:async';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:documentation_ai/feature/landing/bloc/events.dart';
import 'package:documentation_ai/feature/landing/bloc/state.dart';
import 'package:http/http.dart' as http;
import 'dart:typed_data';

final class GenerateBLOC extends Bloc<GenerateEvent, GenerateState> {
  GenerateBLOC() : super(GenerateState.initial()) {
    // Handle file uploads
    on<UploadFiles>(_onUploadFiles); // Registered handler for uploading files

    // Handle role changes
    on<RoleChanged>(_onRoleChanged);

    // Handle file removals
    on<RemoveFile>(_onRemoveFile);

    // Handle report submission (OpenAI API call)
    on<SubmitEvent>(_onSubmit);

    // Handle file selection event
    on<SelectFilesToUpload>(_onSelectFilesToUpload);
  }

  // Handling the SelectFilesToUpload event (logging only)
  FutureOr<void> _onSelectFilesToUpload(
      SelectFilesToUpload event, Emitter<GenerateState> emit) {
    // Logging when files are being selected
    print("Files are being selected...");
  }

  // Handling file uploads
  FutureOr<void> _onUploadFiles(
      UploadFiles event, Emitter<GenerateState> emit) {
    // Merging the newly uploaded files with the existing files
    final newFiles = {
      ...state.files,
      ...event.content
    }; // Merge new and old files
    emit(state.copyWith(files: newFiles));
    print("Files successfully uploaded.");
  }

  // Handling role changes
  FutureOr<void> _onRoleChanged(
      RoleChanged event, Emitter<GenerateState> emit) {
    emit(state.copyWith(role: event.role));
  }

  // Handling file removals
  FutureOr<void> _onRemoveFile(RemoveFile event, Emitter<GenerateState> emit) {
    final files = {...state.files};
    files.remove(event.fileName);
    emit(state.copyWith(files: files));
  }

  // Handling report generation and submission
  Future<void> _onSubmit(SubmitEvent event, Emitter<GenerateState> emit) async {
    // Check if files and role are selected
    if (state.files.isEmpty || state.role.isEmpty) {
      print('File or Role is missing');
      return;
    }

    // Mark as submitting
    emit(state.copyWith(isSubmitting: true));

    try {
      // Call the OpenAI API to generate the report
      String report = await _generateReport(state.role, state.files);

      // Update the state with the generated report and mark as not submitting
      emit(state.copyWith(report: report, isSubmitting: false));
    } catch (error) {
      // Handle errors in API call and print the error message
      print('Error generating report: $error');
      emit(state.copyWith(isSubmitting: false, error: error.toString()));
    }
  }

  // Function to call the OpenAI API
  Future<String> _generateReport(
      String role, Map<String, Uint8List> files) async {
    // OpenAI API URL
    String apiUrl = "https://api.openai.com/v1/completions";

    // OpenAI API key
    String apiKey = "";

    // Combine the contents of the uploaded files
    String fileContents =
        files.values.map((file) => utf8.decode(file)).join("\n\n");

    // Create the prompt based on the role
    String prompt = _createPrompt(role, fileContents);

    // Make the HTTP POST request to the OpenAI API using GPT-3.5-turbo
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        'Authorization': 'Bearer $apiKey',
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'model': 'gpt-3.5-turbo', // Switching to GPT-3.5-turbo model
        'prompt': prompt, // The generated prompt based on the role
        'max_tokens': 1000, // Limit the number of tokens in the response
      }),
    );

    // Check the status code of the response
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      return jsonResponse['choices'][0]['text'];
    } else {
      // Print the response body for debugging
      print('Error from OpenAI API: ${response.body}');
      throw Exception('Failed to generate report');
    }
  }

  // Helper function to create the prompt based on the role
  String _createPrompt(String role, String fileContents) {
    if (role == 'Developer') {
      return 'Analyze the following code and provide technical insights for a developer: $fileContents';
    } else if (role == 'CTO') {
      return 'Analyze the following code and provide architectural and security insights for a CTO: $fileContents';
    } else if (role == 'Board Member') {
      return 'Summarize the following code and explain its business value and impact for a Board Member: $fileContents';
    }
    return 'Analyze the following code: $fileContents';
  }
}
