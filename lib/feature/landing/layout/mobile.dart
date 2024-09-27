import 'package:documentation_ai/feature/landing/widget/app_features.dart';
import 'package:documentation_ai/feature/landing/widget/files_role_box.dart';
import 'package:documentation_ai/feature/landing/widget/footer.dart';
import 'package:documentation_ai/feature/landing/widget/header.dart';
import 'package:documentation_ai/feature/landing/widget/submit_button.dart';
import 'package:flutter/material.dart';

class Mobile extends StatefulWidget {
  const Mobile({super.key});

  @override
  State<Mobile> createState() => _MobileState();
}

class _MobileState extends State<Mobile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffD9D9D9),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const Header(mobile: true),
            _kHeadline(heading: 'Features'),
            const AppFeatures(mobile: true),
            const FilesAndRoleBox(mobile: true),
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
