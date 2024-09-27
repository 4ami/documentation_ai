import 'dart:typed_data';
import 'package:documentation_ai/feature/landing/bloc/events.dart';

final class GenerateState {
  final String role;
  final GenerateEvent event;
  final Map<String, Uint8List> files;

  const GenerateState({
    this.role = '',
    this.event = const InitialGenerateEvent(),
    this.files = const {},
  });

  GenerateState copyWith({
    String? role,
    GenerateEvent? event,
    Map<String, Uint8List>? files,
  }) {
    return GenerateState(
      role: role ?? this.role,
      event: event ?? this.event,
      files: files ?? this.files,
    );
  }
}
