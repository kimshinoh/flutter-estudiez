import 'package:flutter/material.dart';
import 'package:fruity/constants/app_theme.dart';
import 'package:fruity/constants/strings.dart';
import 'package:fruity/routes.dart';
import 'package:fruity/ui/home/home_header.dart';
import 'package:fruity/ui/home/home.dart';
import 'package:fruity/ui/splash/splash.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: themeData,
      darkTheme: themeDataDark,
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      routes: Routes.routes,
      title: Strings.appName,
      home: const HomeScreen(),
    );
  }
}
