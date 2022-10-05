import 'package:flutter/material.dart';
import 'package:fruity/ui/course-report/course-report.dart';
import 'package:fruity/ui/course/course.dart';
import 'package:fruity/ui/home/home.dart';
import 'package:fruity/ui/personal/personal_screen.dart';
import 'package:fruity/ui/search/search_screen.dart';
import 'package:fruity/ui/subject/subject.dart';

class MyBottombar extends StatefulWidget {
  const MyBottombar({Key? key}) : super(key: key);

  @override
  State<MyBottombar> createState() => _MyBottombarState();
}

class _MyBottombarState extends State<MyBottombar> {
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    SubjectScreen(),
    SearchScreen(),
    CourseReportScreen(),
    PersonalScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.task_rounded),
            label: 'Subject',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'PhoneBook',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.report),
            label: 'Report',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
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
