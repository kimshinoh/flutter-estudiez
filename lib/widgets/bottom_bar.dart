import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fruity/data/sharedpref/constants/preferences.dart';
import 'package:fruity/models/user/user.dart';
import 'package:fruity/ui/course-report/course-report.dart';
import 'package:fruity/ui/course/course.dart';
import 'package:fruity/ui/home/home.dart';
import 'package:fruity/ui/personal/personal_screen.dart';
import 'package:fruity/ui/search/search_screen.dart';
import 'package:fruity/ui/subject/subject.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyBottombar extends StatefulWidget {
  const MyBottombar({Key? key}) : super(key: key);

  @override
  State<MyBottombar> createState() => _MyBottombarState();
}

class _MyBottombarState extends State<MyBottombar> {
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  int _selectedIndex = 0;
  User? _user = User("", "", "", "", "", null, null, null);

  static List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    SubjectScreen(),
    CourseReportScreen(),
    PersonalScreen()
  ];
  static List<BottomNavigationBarItem> _bottomNBIs = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.task_rounded),
      label: 'Subject',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.report),
      label: 'Report',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: 'Profile',
    ),
  ];
  @override
  void initState() {
    super.initState();
    _paserUser();
  }

  _paserUser() async {
    final SharedPreferences _preferences =
        await SharedPreferences.getInstance();
    String? _userString = _preferences.getString(Preferences.user);
    if (_userString != null) {
      final parsed = jsonDecode(_userString) as Map<String, dynamic>;
      User user = User.fromJson(parsed);
      setState(() {
        _user = user;
      });
      if (_user!.type == "parent") {
        _widgetOptions.insert(2, SearchScreen());
        _bottomNBIs.insert(
          2,
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'PhoneBook',
          ),
        );
      }
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: _bottomNBIs,
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromARGB(255, 5, 142, 216),
        iconSize: 20,
        elevation: 0,
        unselectedFontSize: 10,
        selectedFontSize: 12,
        onTap: _onItemTapped,
      ),
    );
  }
}
