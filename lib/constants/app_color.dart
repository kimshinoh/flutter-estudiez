import 'package:flutter/material.dart';

class AppColors {
  AppColors._();
  //blue
  static MaterialColor palette =
      const MaterialColor(_mcgpalette0PrimaryValue, <int, Color>{
    50: Color(0xFFE3F2FD),
    100: Color(0xFFBBDEFB),
    200: Color(0xFF90CAF9),
    300: Color(0xFF64B5F6),
    400: Color(0xFF42A5F5),
    500: Color(_mcgpalette0PrimaryValue),
    600: Color(0xFF1E88E5),
    700: Color(0xFF1976D2),
    800: Color(0xFF1565C0),
    900: Color(0xFF0D47A1),

  });
  //blue
  static const int _mcgpalette0PrimaryValue = 0xFF5C6BC0; 

  static const MaterialColor paletteAccent =
      MaterialColor(_mcgpalette0AccentValue, <int, Color>{
    100: Color(0xFF82B1FF),
    200: Color(_mcgpalette0AccentValue),
    400: Color(0xFF2962FF),
    700: Color(0xFF0039CB),
  });
  //blue 
  static const int _mcgpalette0AccentValue = 0xFF448AFF;
  static const Color primary = Color.fromARGB(255, 26, 112, 162);
  static const Color backgroudGrey = Color.fromARGB(255, 242, 242, 242);
}
