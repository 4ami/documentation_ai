import 'dart:convert';
import 'package:documentation_ai/conf/shared/constants/image_path.dart';
import 'package:documentation_ai/conf/shared/widgets/logger.dart';
import 'package:documentation_ai/feature/landing/bloc/events.dart';
import 'package:documentation_ai/feature/landing/bloc/generate_bloc.dart';
import 'package:file_picker/_internal/file_picker_web.dart';
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
        FilePickerResult? picker = await FilePickerWeb.platform.pickFiles(
          onFileLoading: (p0) {
            Logger.instance.info(p0.name, location: 'Upload Container');
            context.read<GenerateBLOC>().add(const SelectFilesToUpload());
          },
          allowMultiple: true,
          allowedExtensions: ['py', 'js', 'dart', 'cpp', 'cs', 'ts', 'tsx'],
          type: FileType.custom,
        );

        if (picker == null) return;
        if (picker.files.isEmpty) return;

        Map<String, String> files = {};

        for (PlatformFile file in picker.files) {
          if (file.bytes == null) continue;
          files[file.name] = utf8.decode(file.bytes!);
        }
        _upload(files: files);
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
            Image.asset(ImagePath.upload),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Text(
                textAlign: TextAlign.center,
                'Select Feature Code Files',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            )
          ],
        ),
      ),
    );
  }

  void _upload({required Map<String, String> files}) {
    Logger.instance.info(
      'Adding [UploadFiles] event.',
      location: 'FileUploader',
    );
    context.read<GenerateBLOC>().add(UploadFiles(content: files));
  }
}
