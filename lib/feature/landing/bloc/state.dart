import 'dart:typed_data';

// The state for the GenerateBLOC, storing all relevant data for the process
class GenerateState {
  final Map<String, Uint8List> files;  // Holds the uploaded files and their content
  final String role;  // Stores the currently selected role (Developer, CTO, Board Member)
  final String report;  // Holds the generated report text after submission
  final bool isSubmitting;  // Indicates if the submission is currently in progress
  final String error;  // Stores any error messages from the process

  const GenerateState({
    required this.files,
    required this.role,
    required this.report,
    required this.isSubmitting,  // Tracks submission state
    required this.error,
  });

  // Initial state: No files, no role selected, no report generated, and no submission happening
  factory GenerateState.initial() {
    return const GenerateState(
      files: {},  // No files uploaded initially
      role: '',  // No role selected initially
      report: '',  // No report generated initially
      isSubmitting: false,  // No submission in progress
      error: '',  // No error initially
    );
  }

  // A copyWith method to create a new state when any part of the state changes
  GenerateState copyWith({
    Map<String, Uint8List>? files,
    String? role,
    String? report,
    bool? isSubmitting,
    String? error,
  }) {
    return GenerateState(
      files: files ?? this.files,  // Retain current files unless updated
      role: role ?? this.role,  // Retain current role unless updated
      report: report ?? this.report,  // Retain current report unless updated
      isSubmitting: isSubmitting ?? this.isSubmitting,  // Retain current submitting state unless updated
      error: error ?? this.error,  // Retain current error state unless updated
    );
  }
}

// The UploadedFile class for handling individual files
class UploadedFile {
  final String name;  // The file name
  final Uint8List content;  // The file content in bytes

  UploadedFile({
    required this.name,
    required this.content,
  });
}
