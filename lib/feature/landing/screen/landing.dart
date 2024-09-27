import 'package:documentation_ai/conf/shared/widgets/responsive.dart';
import 'package:documentation_ai/feature/landing/layout/desktop.dart';
import 'package:documentation_ai/feature/landing/layout/mobile.dart';
import 'package:flutter/material.dart';

class Landing extends StatefulWidget {
  const Landing({super.key});

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  @override
  Widget build(BuildContext context) {
    return const Responsive(desktop: Desktop(), mobile: Mobile());
  }
}
