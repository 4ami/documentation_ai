import 'package:documentation_ai/feature/landing/bloc/events.dart';

final class GenerateState {
  final String role;
  final GenerateEvent event;
  final Map<String, String> files;

  const GenerateState({
    this.role = '',
    this.event = const InitialGenerateEvent(),
    this.files = const {},
  });

  GenerateState copyWith({
    String? role,
    GenerateEvent? event,
    Map<String, String>? files,
  }) {
    return GenerateState(
      role: role ?? this.role,
      event: event ?? this.event,
      files: files ?? this.files,
    );
  }
}
