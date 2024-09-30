sealed class GenerateEvent {
  const GenerateEvent();

  String get message => '';
  String get description => 'Super class';
}

final class InitialGenerateEvent extends GenerateEvent {
  const InitialGenerateEvent();

  @override
  String get description => 'Initial event';
}

final class SelectFilesToUpload extends GenerateEvent {
  const SelectFilesToUpload();
  @override
  String get description => 'User is selecting files... wait';
}

final class UploadFilesFailed extends GenerateEvent {
  final String error;
  const UploadFilesFailed({required this.error});

  @override
  String get message => error;

  @override
  String get description => 'Uploading files filed.';
}

final class UploadFiles extends GenerateEvent {
  final Map<String, String> content;
  const UploadFiles({required this.content});

  @override
  String get message => 'Uploading files';
  @override
  String get description => 'Contents Uploaded';
}

final class UploadFilesSuccess extends GenerateEvent {
  const UploadFilesSuccess();
  @override
  String get description => 'Files uploaded successfully';
}

final class RemoveFile extends GenerateEvent {
  final String fileName;
  const RemoveFile({required this.fileName});

  @override
  String get description => 'User is removing file.';
}

final class RemovingFileFailed extends GenerateEvent {
  const RemovingFileFailed();

  @override
  String get message => 'Removing file is failed';
  @override
  String get description => 'Removing failed';
}

final class RoleChanged extends GenerateEvent {
  final String role;
  const RoleChanged({required this.role});
  @override
  String get description => 'Role is changed to $role';
}

final class PendingOperation extends GenerateEvent {
  const PendingOperation();

  @override
  String get description => 'Waiting event due processing or async request';
}
