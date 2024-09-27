import 'package:documentation_ai/conf/shared/widgets/logger.dart';
import 'package:documentation_ai/feature/landing/bloc/generate_bloc.dart';
import 'package:documentation_ai/feature/landing/screen/landing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    Logger.instance.info('Starting app', location: 'APP');
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => GenerateBLOC())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const Landing(),
        title: 'Generative Code Reports',
        theme: ThemeData.from(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xff00290E),
          ),
        ),
      ),
    );
  }
}
