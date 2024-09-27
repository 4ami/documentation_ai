import 'package:flutter/material.dart';

class NeomorphismContainer extends StatelessWidget {
  const NeomorphismContainer({
    super.key,
    this.height = 150,
    this.width = 350,
    this.radius = 11,
    this.contentPadding = 25,
    this.verticalMargin = 15,
    this.horizontalMargin = 0,
    required this.child,
  });
  final double radius, contentPadding, verticalMargin, horizontalMargin;
  final double? width, height;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: Container(
        alignment: Alignment.center,
        width: width,
        height: height,
        padding: EdgeInsets.all(contentPadding),
        margin: EdgeInsets.symmetric(
          vertical: verticalMargin,
          horizontal: horizontalMargin,
        ),
        decoration: _kDecoration(),
        child: child,
      ),
    );
  }

  BoxDecoration _kDecoration() {
    return BoxDecoration(
      color: const Color(0xffD9D9D9),
      borderRadius: BorderRadius.circular(radius),
      boxShadow: _kShadow,
    );
  }

  List<BoxShadow> get _kShadow {
    return [
      const BoxShadow(
        color: Color(0xffB4B3B3),
        offset: Offset(5, 5),
        blurRadius: 19.4,
      ),
      BoxShadow(
        color: const Color(0xffFFFFFF).withOpacity(.5),
        offset: -const Offset(15, 15),
        blurRadius: 32.8,
      ),
      BoxShadow(
        color: const Color(0xffA4A4A4).withOpacity(.25),
        offset: const Offset(0, 0),
        blurRadius: 24.3,
        blurStyle: BlurStyle.inner,
      ),
    ];
  }
}
