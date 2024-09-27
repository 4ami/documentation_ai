import 'package:documentation_ai/app.dart';
import 'package:documentation_ai/conf/shared/widgets/logger.dart';
import 'package:flutter/material.dart';

void main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    runApp(const App());
  } catch (E) {
    Logger.instance.error(
      'Main failed to start. [Exit code -1]',
      location: 'main',
      error: E,
    );
  }
}
