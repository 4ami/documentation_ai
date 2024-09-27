import 'package:documentation_ai/conf/shared/widgets/logger.dart';
import 'package:documentation_ai/feature/landing/bloc/events.dart';
import 'package:documentation_ai/feature/landing/bloc/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final class GenerateBLOC extends Bloc<GenerateEvent, GenerateState> {
  GenerateBLOC() : super(const GenerateState()) {
    on<SelectFilesToUpload>((event, emit) {
      Logger.instance.warning(
        'User is selecting files to upload',
        location: 'File Uploader [BLOC]',
      );
    });

    on<UploadFiles>((event, emit) {
      try {
        emit(state.copyWith(event: const PendingOperation()));

        final newFils = event.content;
        final old = state.files;

        emit(state.copyWith(
          files: {...old, ...newFils},
          event: const UploadFilesSuccess(),
        ));

        Logger.instance.info(
          'Uploading files is complete',
          location: 'File Uploader [BLOC]',
        );
      } catch (E) {
        Logger.instance.error(
          'Error while uploading files',
          location: 'File Uploader [BLOC]',
          error: E,
        );
        emit(state.copyWith(event: UploadFilesFailed(error: E.toString())));
      }
    });

    on<RemoveFile>((event, emit) {
      try {
        emit(state.copyWith(event: const PendingOperation()));
        final files = state.files;
        files.removeWhere(
          (key, value) => key.contains(event.fileName),
        );

        Logger.instance.info(
          'Files remaining: ${files.keys.toList()}',
          location: 'File Uploader [BLOC]',
        );

        emit(state.copyWith(files: files));
      } catch (E) {
        Logger.instance.error(
          'Error while deleting file',
          location: 'File Uploader [BLOC]',
          error: E,
        );
        emit(state.copyWith(event: const RemovingFileFailed()));
      }
    });

    on<RoleChanged>((event, emit) {
      Logger.instance.info(
        'Before: [${state.role}]',
        location: 'File Uploader',
      );
      emit(state.copyWith(role: event.role));
      Logger.instance.info(
        'After:[${event.role}]',
        location: 'File Uploader',
      );
    });
  }
}
