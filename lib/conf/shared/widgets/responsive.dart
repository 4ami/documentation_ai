import 'package:documentation_ai/conf/shared/widgets/logger.dart';
import 'package:flutter/material.dart';

class Responsive extends StatefulWidget {
  const Responsive({super.key, required this.desktop, required this.mobile});
  final Widget mobile, desktop;
  @override
  State<Responsive> createState() => _ResponsiveState();
}

class _ResponsiveState extends State<Responsive> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) {
        Logger.instance.info(
          'Max Width: ${constraint.maxWidth}',
          location: 'Responsive Layout Builder',
        );
        if (constraint.maxWidth < 700) {
          Logger.instance.warning(
            'Display Mobile Layout',
            location: 'Responsive Layout Builder',
          );
          return widget.mobile;
        }
        Logger.instance.warning(
          'Display Desktop Layout',
          location: 'Responsive Layout Builder',
        );
        return widget.desktop;
      },
    );
  }
}
