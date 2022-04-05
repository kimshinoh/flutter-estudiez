import 'package:flutter/cupertino.dart';

class RadiantGradientMask extends StatelessWidget {
  RadiantGradientMask(
      {required this.child,
      required this.firstColor,
      required this.secondColor});
  final Widget child;
  final Color firstColor;
  final Color secondColor;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => RadialGradient(
        center: Alignment.center,
        radius: 0.5,
        colors: [firstColor, secondColor],
        tileMode: TileMode.mirror,
      ).createShader(bounds),
      child: child,
    );
  }
}
