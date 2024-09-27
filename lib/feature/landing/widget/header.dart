import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key, this.mobile = false});
  final bool mobile;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      clipBehavior: Clip.none,
      backgroundColor: Theme.of(context).colorScheme.primary,
      expandedHeight: 150,
      flexibleSpace: FlexibleSpaceBar(
        stretchModes: const [StretchMode.fadeTitle, StretchMode.zoomBackground],
        centerTitle: true,
        expandedTitleScale: mobile ? 1 : 1.5,
        titlePadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
        title: Container(
          padding: EdgeInsets.all(mobile ? 10 : 25),
          decoration: _kDecoration(context),
          child: const Text(
            'Generative Code Reports',
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  BoxDecoration _kDecoration(BuildContext context) {
    return BoxDecoration(
      color: Theme.of(context).colorScheme.primary,
      borderRadius: BorderRadius.circular(25),
      boxShadow: _kShadow,
    );
  }

  List<BoxShadow> get _kShadow {
    return [
      BoxShadow(
        color: const Color(0xff000000).withOpacity(.25),
        offset: const Offset(5, 5),
        blurRadius: 22.4,
      ),
      BoxShadow(
        color: const Color(0xff3B5246).withOpacity(.25),
        offset: -const Offset(5, 5),
        blurRadius: 29,
      ),
      BoxShadow(
        color: const Color(0xff767676).withOpacity(.25),
        offset: const Offset(0, 0),
        blurRadius: 12.1,
        blurStyle: BlurStyle.inner,
      ),
    ];
  }
}
