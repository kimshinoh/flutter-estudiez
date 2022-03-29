import 'package:flutter/material.dart';

class AppColors {
  AppColors._();
  static MaterialColor palette =
      const MaterialColor(_mcgpalette0PrimaryValue, <int, Color>{
    50: Color(0xFFE0F4E8),
    100: Color(0xFFB3E3C6),
    200: Color(0xFF80D1A0),
    300: Color(0xFF4DBF7A),
    400: Color(0xFF26B15E),
    500: Color(_mcgpalette0PrimaryValue),
    600: Color(0xFF009B3B),
    700: Color(0xFF009132),
    800: Color(0xFF00882A),
    900: Color(0xFF00771C),
  });
  static const int _mcgpalette0PrimaryValue = 0xFF00A341;

  static const MaterialColor paletteAccent =
      MaterialColor(_mcgpalette0AccentValue, <int, Color>{
    100: Color(0xFFA5FFB3),
    200: Color(_mcgpalette0AccentValue),
    400: Color(0xFF3FFF5C),
    700: Color(0xFF25FF47),
  });
  static const int _mcgpalette0AccentValue = 0xFF72FF88;
}
