import 'package:documentation_ai/feature/landing/widget/submit_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../widget/app_features.dart';
import '../widget/files_role_box.dart';
import '../widget/footer.dart';
import '../widget/header.dart';

class Desktop extends StatefulWidget {
  const Desktop({super.key});

  @override
  State<Desktop> createState() => _DesktopState();
}

class _DesktopState extends State<Desktop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffD9D9D9),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const Header(),
            _kHeadline(heading: 'Features'),
            const AppFeatures(),
            const FilesAndRoleBox(),
            const SubmitButton(),
            const Footer(),
          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter _kHeadline({required String heading}) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Text(
          heading,
          textAlign: TextAlign.center,
          style: displayLarg,
        ),
      ),
    );
  }

  TextStyle? get displayLarg {
    return Theme.of(context).textTheme.displayLarge;
  }
}
