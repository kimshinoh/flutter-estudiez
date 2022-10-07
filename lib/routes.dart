import 'package:flutter/material.dart';
import 'package:fruity/ui/auth/login.dart';
import 'package:fruity/ui/auth/register.dart';
import 'package:fruity/ui/course-report/course-report.dart';
import 'package:fruity/ui/course/course.dart';
import 'package:fruity/ui/home/home.dart';
import 'package:fruity/ui/personal/setting_screen.dart';
import 'package:fruity/ui/search/search_screen.dart';
import 'package:fruity/ui/splash/splash.dart';
import 'package:fruity/ui/subject/subject.dart';

class Routes {
  Routes._();

  //static variables
  static const String splash = '/splash';
  static const String home = '/home';
  static const String search = '/search';
  static const String login = '/login';
  static const String register = '/register';
  static const String user_profile = '/user_profile';
  static const String setting = '/setting';

  static const String course = '/course';
  static const String subject = '/subject';
  static const String report = '/report';


  static final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
    splash: (BuildContext context) => const SplashScreen(),
    home: (BuildContext context) => const HomeScreen(),
    course: (BuildContext context) => const CourseScreen(),
    subject: (BuildContext context) => const SubjectScreen(),
    report: (BuildContext context) => const CourseReportScreen(),
    search: (BuildContext context) => const SearchScreen(),
    setting: (BuildContext context) => SettingScreen(),
    login: (BuildContext context) => LoginScreen(),
    register: (BuildContext context) => RegisterScreen(),
  };
}
