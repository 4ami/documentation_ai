import 'package:documentation_ai/feature/landing/bloc/generate_bloc.dart';
import 'package:documentation_ai/feature/landing/widget/uploaded_file_metadata.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UploadedFilesMetadataBuilder extends StatelessWidget {
  const UploadedFilesMetadataBuilder({super.key, this.mobile = false});
  final bool mobile;

  @override
  Widget build(BuildContext context) {
    final watcher = context.watch<GenerateBLOC>().state.files;
    return SizedBox(
      height: 250,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: mobile ? 1 : 4,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
          childAspectRatio: mobile ? 3 : 2,
        ),
        itemBuilder: (context, i) {
          final double size = watcher.entries.elementAt(i).value.length / 1024;
          return UploadedFileMetaData(
            fileName: watcher.entries.elementAt(i).key,
            size: '${size.toStringAsFixed(2)} KB',
          );
        },
        itemCount: watcher.length,
      ),
    );
  }
}
