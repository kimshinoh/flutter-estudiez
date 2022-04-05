import 'package:flutter/cupertino.dart';

class RadiantGradientMask extends StatelessWidget {
  const RadiantGradientMask(
      {required this.child,
      required this.firstColor,
      required this.secondColor});
  final Widget child;
  final Color firstColor;
  final Color secondColor;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (Rect bounds) => RadialGradient(
        colors: [firstColor, secondColor],
        tileMode: TileMode.mirror,
      ).createShader(bounds),
      child: child,
    );
  }
}
