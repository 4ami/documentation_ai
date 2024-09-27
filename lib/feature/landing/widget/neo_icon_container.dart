import 'package:flutter/material.dart';

class NeomorphismIconContainer extends StatelessWidget {
  const NeomorphismIconContainer({
    super.key, required this.icon
  });
  final String icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 56.64,
      height: 56.64,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(horizontal: 15),
      decoration: _kDecoration(),
      child: Image.asset(icon),
    );
  }

  BoxDecoration _kDecoration() {
    return BoxDecoration(
      color: const Color(0xffD9D9D9),
      borderRadius: BorderRadius.circular(11),
      boxShadow: _kShadow,
    );
  }

  List<BoxShadow> get _kShadow {
    return [
        BoxShadow(
          color: const Color(0xff000000).withOpacity(.25),
          blurRadius: 5.9,
          offset: const Offset(0, 4),
        ),
        BoxShadow(
          color: const Color(0xff000000).withOpacity(.25),
          blurRadius: 19.5,
          offset: const Offset(0, 0),
          blurStyle: BlurStyle.inner,
        )
      ];
  }
}
