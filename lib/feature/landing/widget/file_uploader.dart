import 'dart:typed_data';
import 'package:documentation_ai/conf/shared/constants/image_path.dart';
import 'package:documentation_ai/conf/shared/widgets/logger.dart';
import 'package:documentation_ai/feature/landing/bloc/events.dart';
import 'package:documentation_ai/feature/landing/bloc/generate_bloc.dart';
import 'package:file_picker/file_picker.dart'; 
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FileUploader extends StatefulWidget {
  const FileUploader({super.key});

  @override
  State<FileUploader> createState() => _FileUploaderState();
}

class _FileUploaderState extends State<FileUploader> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        try {
          // Use FilePicker for picking files across platforms (web, mobile, desktop)
          FilePickerResult? picker = await FilePicker.platform.pickFiles(
            allowMultiple: true, // Allow multiple file uploads
            allowedExtensions: [
              'py',
              'js',
              'dart',
              'cpp',
              'cs',
              'ts',
              'tsx'
            ], // Specific file types
            type: FileType.custom,
          );

          if (picker == null || picker.files.isEmpty)
            return; // If no files are picked, return

          // Log the file-picking process
          context.read<GenerateBLOC>().add(const SelectFilesToUpload());
          Logger.instance.info('Files selected: ${picker.files.length}',
              location: 'File Uploader');

          // Preparing files to be uploaded
          Map<String, Uint8List> files = {};
          for (PlatformFile file in picker.files) {
            if (file.bytes == null) continue; // Skip if no bytes
            files[file.name] = file.bytes!; // Add file content
          }

          // Dispatch the event to upload files to the BLoC
          context.read<GenerateBLOC>().add(UploadFiles(content: files));
        } catch (e) {
          // Log any errors that happen during the file-picking process
          Logger.instance.error('Error while picking files: $e',
              location: 'File Uploader');
        }
      },
      child: Container(
        width: MediaQuery.sizeOf(context).width,
        height: 450,
        decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).colorScheme.primary,
            width: 1.5,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(ImagePath.upload), // Display upload image
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Text(
                'Select Feature Code Files',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
