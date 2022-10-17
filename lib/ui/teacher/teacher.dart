import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fruity/data/network/rest_client.dart';
import 'package:fruity/data/sharedpref/constants/preferences.dart';
import 'package:fruity/models/subject/subject.dart';
import 'package:fruity/models/subject/subjectClass.dart';
import 'package:fruity/models/user/teacher.dart';
import 'package:fruity/models/user/user.dart';
import 'package:fruity/ui/course/course.dart';
import 'package:fruity/ui/teacher/list_marks.dart';
import 'package:fruity/utils/datetime_util.dart';
import 'package:fruity/utils/notify_util.dart';
import 'package:fruity/utils/string.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TeacherScreen extends StatefulWidget {
  const TeacherScreen({Key? key}) : super(key: key);

  @override
  State<TeacherScreen> createState() => _TeacherScreenState();
}

class _TeacherScreenState extends State<TeacherScreen> {
  List<SubjectClass> _subjectClass = [];
  User _user =
      User("", "", "", "", "", "", null, Teacher("", "", "", "", ""), null);
  Teacher _teacher = Teacher("", "", "", "", "");
  List<SubjectClass> _subjectClassOfTeacher = [];
  bool isInProgress = false;
  @override
  void initState() {
    super.initState();
    _paserUser();
  }

  _paserUser() async {
    final SharedPreferences _preferences =
        await SharedPreferences.getInstance();
    String? _userString = _preferences.getString(Preferences.user);
    var token = await _preferences.getString(Preferences.token);
    if (_userString != null) {
      final parsed = jsonDecode(_userString) as Map<String, dynamic>;
      User user = User.fromJson(parsed);
      setState(() {
        _user = user;
        _teacher = user.teacher!;
      });
    }
    String teacherId = _teacher.id;
    await RestClient().get("/subject-class/teacher/$teacherId", headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    }).then((value) async {
      final parsed = jsonDecode(value.body);
      setState(() {
        _subjectClassOfTeacher = parsed
            .map<SubjectClass>(
                (json) => SubjectClass.fromJson(json as Map<String, dynamic>))
            .toList() as List<SubjectClass>;
      });
    }).catchError((error) {
      print(error);
      NotifyHelper.error(context, "Something went wrong");
    }).whenComplete(() {
      if (mounted) {
        setState(() {
          isInProgress = false;
        });
      }
    });
  }

  @override
  void deactivate() {
    super.deactivate();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Container(
                child: Column(
              children: [_topBar(), _main()],
            ))));
  }

  Widget chip(String label, Color color) {
    return Chip(
      labelPadding: EdgeInsets.all(5.0),
      avatar: CircleAvatar(
        backgroundColor: Colors.grey.shade600,
        child: Text(label[0].toUpperCase()),
      ),
      label: Text(
        label,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      backgroundColor: color,
      elevation: 6.0,
      shadowColor: Colors.grey[60],
      padding: EdgeInsets.all(6.0),
    );
  }

  Widget _main() {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Expanded(
        child: Container(
      padding: const EdgeInsets.fromLTRB(16, 60, 16, 0),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'All Classs',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: SizedBox(
                  height: height * 0.5,
                  child: _subjectClassOfTeacher.length == 0
                      ? Center(
                          child: Text("No data"),
                        )
                      : ListView.builder(
                          itemCount: _subjectClassOfTeacher.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ListMark(
                                                subjectClassId:
                                                    _subjectClassOfTeacher[
                                                            index]
                                                        .id,
                                                subjectCode:
                                                    _subjectClassOfTeacher[
                                                            index]
                                                        .code!,
                                                subjectName:
                                                    _subjectClassOfTeacher[
                                                            index]
                                                        .name,
                                              )));
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(bottom: 10),
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade200,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 1,
                                        blurRadius: 2,
                                        offset: const Offset(0, 3),
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.door_front_door_outlined,
                                            size: 40,
                                            color: Colors.blue.shade600,
                                          ),
                                          const SizedBox(width: 10),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                StringHelper.maxLength(
                                                    _subjectClassOfTeacher[
                                                            index]
                                                        .name,
                                                    20),
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                _subjectClassOfTeacher[index]
                                                    .code!,
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    color: Colors.grey),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            DateTimeHelper.formatDate(
                                                _subjectClassOfTeacher[index]
                                                    .createdAt,
                                                'dd/MM/yyyy'),
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.normal,
                                                color: Colors.grey),
                                          ),
                                          const SizedBox(
                                            height: 6,
                                          ),
                                          // Text(
                                          //  "456",
                                          //   style: TextStyle(
                                          //       fontSize: 12,
                                          //       fontWeight: FontWeight.normal,
                                          //       color: Colors.orange),
                                          // ),
                                        ],
                                      )
                                    ],
                                  ),
                                ));
                          },
                        )))
        ],
      ),
    ));
  }

  Widget _topBar() {
    final double width = MediaQuery.of(context).size.width;
    return Container(
        padding: EdgeInsets.fromLTRB(16, 40, 16, 0),
        height: 200,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/card.jpg"),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(40),
            bottomRight: Radius.circular(40),
          ),
        ),
        child: Stack(clipBehavior: Clip.values[0], children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 10,
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Container(
                        margin: EdgeInsets.only(right: 16),
                        child: CircleAvatar(
                          radius: 16,
                          backgroundImage: NetworkImage(_user.avatar ??
                              "https://i.stack.imgur.com/l60Hf.png"),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            Container(
              padding: EdgeInsets.fromLTRB(16, 10, 0, 0),
              child: Text(
                "Hello",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ]),
          Positioned(
            top: 100,
            left: 45,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              height: 100,
              width: width * 0.7,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _teacher.name ?? "Unknown",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    _user.email ?? "Unknown",
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.7),
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  Divider(
                    color: Colors.black,
                    height: 20,
                    thickness: 5,
                    indent: 20,
                    endIndent: 20,
                  ),
                ],
              ),
            ),
          )
        ]));
  }
}
