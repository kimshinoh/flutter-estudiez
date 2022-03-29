import 'package:flutter/material.dart';
import 'package:fruity/constants/app_color.dart';
import 'package:fruity/constants/font_family.dart';

final ThemeData themeData = ThemeData(
  fontFamily: FontFamily.openSans,
  brightness: Brightness.light,
  primarySwatch: AppColors.palette,
  primaryColor: AppColors.palette[500],
);

final ThemeData themeDataDark = ThemeData(
  fontFamily: FontFamily.openSans,
  brightness: Brightness.dark,
  primaryColor: AppColors.palette[500],
);
