import 'package:flutter/material.dart';
import 'package:fruity/ui/home/home.dart';
import 'package:fruity/ui/splash/splash.dart';
import 'package:fruity/ui/todo/todo_screen.dart';

class Routes {
  Routes._();

  //static variables
  static const String splash = '/splash';
  static const String home = '/home';
  static const String todo = '/todo';

  static final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
    splash: (BuildContext context) => const SplashScreen(),
    home: (BuildContext context) => const HomeScreen(),
    todo: (BuildContext context) => TodoScreen()
  };
}
