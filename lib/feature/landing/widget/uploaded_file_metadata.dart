import 'package:documentation_ai/feature/landing/bloc/events.dart';
import 'package:documentation_ai/feature/landing/bloc/generate_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UploadedFileMetaData extends StatelessWidget {
  const UploadedFileMetaData({
    super.key,
    required this.fileName,
    required this.size,
  });
  final String fileName, size;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: _kDecoration,
      child: ListTile(
        leading: IconButton.filled(
          style: _kBS(context),
          onPressed: () {
            context.read<GenerateBLOC>().add(RemoveFile(fileName: fileName));
          },
          color: const Color(0xffD9D9D9),
          icon: const Icon(Icons.delete),
        ),
        title: Text(fileName),
        subtitle: Text(size),
      ),
    );
  }

  ButtonStyle _kBS(BuildContext context) {
    return ButtonStyle(
      backgroundColor: MaterialStateProperty.resolveWith(
        (state) {
          if (state.contains(MaterialState.disabled)) return Colors.grey;
          return Theme.of(context).colorScheme.error;
        },
      ),
      shape: MaterialStatePropertyAll(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  BoxDecoration get _kDecoration => BoxDecoration(
      borderRadius: BorderRadius.circular(20), boxShadow: _kShadow);

  List<BoxShadow> get _kShadow {
    return [
      BoxShadow(
        color: const Color(0xff000000).withOpacity(.1),
        offset: const Offset(0, 0),
        blurRadius: 19.5,
        blurStyle: BlurStyle.inner,
      ),
      BoxShadow(
        color: const Color(0xffD9D9D9).withOpacity(.5),
        offset: const Offset(0, 4),
        blurRadius: 25.9,
      ),
    ];
  }
}
