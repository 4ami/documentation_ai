import 'dart:developer';

final class Logger {
  Logger._();

  //Single instance
  static final Logger _instance = Logger._();
  //Get Single instance globally
  static Logger get instance => _instance;
  //Get Single instance using factory
  factory Logger() => _instance;

  void error(
    String message, {
    StackTrace? stackTrace,
    Object? error,
    required String location,
  }) {
    log(
      '${_LogColors.error}Time: [${DateTime.timestamp()}]\nLocation: $location.\nMessage: $message.',
      error: error != null ? '${_LogColors.error}$error' : null,
      stackTrace: stackTrace,
      level: 1000,
      name: 'Error 🔴',
      time: DateTime.timestamp(),
    );
  }

  void warning(
    String message, {
    StackTrace? stackTrace,
    Object? error,
    required String location,
  }) {
    log(
      'Time: [${DateTime.timestamp()}]\nLocation: $location.\nMessage: $message',
      error: error,
      stackTrace: stackTrace,
      level: 900,
      name: 'Warning ⚠️',
      time: DateTime.timestamp(),
    );
  }

  void info(
    String message, {
    StackTrace? stackTrace,
    Object? error,
    required String location,
  }) {
    log(
      '${_LogColors.info}Time: [${DateTime.timestamp()}]\nLocation: $location.\nMessage: $message',
      stackTrace: stackTrace,
      error: error != null ? '${_LogColors.info}$error' : null,
      level: 800,
      name: 'Info 💬',
      time: DateTime.timestamp(),
    );
  }
}

final class _LogColors {
  static const String error = '\x1B[31m';
  static const String info = '\x1B[37m';
}
