import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      clipBehavior: Clip.none,
      backgroundColor: Theme.of(context).colorScheme.primary,
      centerTitle: true,
      title: Text(
        'Copyright \u00a9 Khalid&Mahdi',
        textAlign: TextAlign.center,
        style: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(color: Theme.of(context).colorScheme.onPrimary),
      ),
    );
  }
}
