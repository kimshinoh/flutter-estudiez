import 'package:flutter/material.dart';

class AppColors {
  AppColors._();
  static MaterialColor palette =
      const MaterialColor(_mcgpalette0PrimaryValue, <int, Color>{
    50: Color(0xFFEAF5E1),
    100: Color(0xFFCBE6B3),
    200: Color(0xFFA8D581),
    300: Color(0xFF85C44F),
    400: Color(0xFF6AB729),
    500: Color(_mcgpalette0PrimaryValue),
    600: Color(0xFF49A303),
    700: Color(0xFF409902),
    800: Color(0xFF379002),
    900: Color(0xFF277F01),
  });
  static const int _mcgpalette0PrimaryValue = 0xFF50AA03;

  static const MaterialColor paletteAccent =
      MaterialColor(_mcgpalette0AccentValue, <int, Color>{
    100: Color(0xFFBFFFAD),
    200: Color(_mcgpalette0AccentValue),
    400: Color(0xFF6FFF47),
    700: Color(0xFF5BFF2D),
  });
  static const int _mcgpalette0AccentValue = 0xFF97FF7A;
  static const Color primary = Color.fromARGB(255, 26, 162, 70);
  static const Color backgroudGrey = Color.fromARGB(255, 242, 242, 242);
}
