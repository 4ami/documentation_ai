import 'package:documentation_ai/conf/shared/constants/icon_path.dart';
import 'package:documentation_ai/feature/landing/widget/neo_container.dart';
import 'package:flutter/material.dart';

import 'neo_icon_container.dart';

class AppFeatures extends StatelessWidget {
  const AppFeatures({super.key, this.mobile = false});
  final bool mobile;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        alignment: WrapAlignment.center,
        runAlignment: WrapAlignment.center,
        direction: mobile ? Axis.vertical : Axis.horizontal,
        children: features,
      ),
    );
  }

  List<Widget> get features {
    return [
      NeomorphismContainer(
        child: _FeatureChild(
          content: 'Document Your Features',
          path: IconPath.features,
        ),
      ),
      if (!mobile)
        Padding(
          padding: const EdgeInsets.only(bottom: 80.0, left: 25, right: 25),
          child: NeomorphismContainer(
            width: 400,
            child: _FeatureChild(
              content: 'Don’t waste your time in writing documents.',
              path: IconPath.clock,
              contentWidth: 200,
            ),
          ),
        )
      else
        NeomorphismContainer(
          child: _FeatureChild(
            content: 'Don’t waste your time in writing documents.',
            path: IconPath.clock,
          ),
        ),
      NeomorphismContainer(
        child: _FeatureChild(
          path: IconPath.checkCircle,
          content: 'Different documents based on your role',
          contentWidth: !mobile ? 200 : 150,
        ),
      ),
    ];
  }
}

class _FeatureChild extends StatelessWidget {
  const _FeatureChild({
    required this.content,
    required this.path,
    this.contentWidth = 150,
  });

  final String path, content;
  final double contentWidth;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        NeomorphismIconContainer(icon: path),
        SizedBox(
          width: contentWidth,
          child: Text(
            content,
            overflow: TextOverflow.visible,
            textAlign: TextAlign.center,
            softWrap: true,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
      ],
    );
  }
}
