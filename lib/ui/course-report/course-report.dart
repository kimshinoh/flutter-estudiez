import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fruity/data/network/rest_client.dart';
import 'package:fruity/data/sharedpref/constants/preferences.dart';
import 'package:fruity/models/exam/exam.dart';
import 'package:fruity/utils/notify_util.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CourseReportScreen extends StatefulWidget {
  const CourseReportScreen({Key? key}) : super(key: key);

  @override
  State<CourseReportScreen> createState() => _CourseReportScreen();
}

class _CourseReportScreen extends State<CourseReportScreen> {
  int _selectedIndex = 3;
  late List<Exam> _exam = [];
  bool isInProgress = false;

  @override
  void initState() {
    super.initState();
    _getExam();
  }

  @override
  void deactivate() {
    super.deactivate();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  _getExam() async {
    setState(() {
      isInProgress = true;
    });
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    var token = await _preferences.getString(Preferences.token);
    await RestClient().get("/exam", headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    }).then((value) async {
      List<dynamic>? body = jsonDecode(value.body) as List<dynamic>;
      setState(() => {
            _exam = body
                .map<Exam>(
                    (json) => Exam.fromJson(json as Map<String, dynamic>))
                .toList()
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
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Container(
                height: MediaQuery.of(context).size.height,
                padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/card.jpg"),
                    fit: BoxFit.fitHeight,
                  ),
                ),
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _topBar(),
                    _header(),
                    const SizedBox(height: 30),
                    _miniDivider(),
                    const SizedBox(height: 10),
                    _main(),
                  ],
                ))));
  }

  Widget _miniDivider() {
    return Container(
      height: 4,
      width: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey.shade300,
      ),
    );
  }

  Widget _main() {
    final f = new DateFormat('yyyy-MM-dd');
    return Expanded(
        child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
        color: Colors.white,
      ),
      padding: const EdgeInsets.fromLTRB(16, 25, 16, 0),
      width: double.infinity,
      child: SizedBox(
          height: 400,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: _exam.length,
            itemBuilder: (_, index) {
              Exam examData = _exam[index];
              return Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            width: double.infinity,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(f.format(examData.createdAt as DateTime),
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                      )),
                                  Container(
                                      margin: EdgeInsets.only(top: 10),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            CircleAvatar(
                                              radius: 30,
                                              backgroundImage: NetworkImage(
                                                  "https://scontent.fsgn2-1.fna.fbcdn.net/v/t39.30808-6/308505217_1594721400924906_3025204205154832825_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=2lJNGFkqN3MAX95hzcy&tn=MMQY6WMhs1Yzm49w&_nc_ht=scontent.fsgn2-1.fna&oh=00_AT-7ehVgitOfs9wIgkFlO58xGwK9IcqyoInjUVz_jeQ75g&oe=633D3EFE"),
                                            ),
                                            Container(
                                                child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(examData.name.toString(),
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w500)),
                                                const SizedBox(height: 5),
                                                Text(
                                                    examData.subjectClass
                                                        .toString(),
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        color: Color.fromARGB(
                                                            255,
                                                            142,
                                                            141,
                                                            141))),
                                              ],
                                            )),
                                            Text(examData.duration.toString(),
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Color.fromARGB(
                                                        255, 188, 188, 188)))
                                          ]))
                                ]))
                      ]));
            },
          )),
    ));
  }

  Widget _header() {
    return Container(
        margin: const EdgeInsets.only(top: 24),
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(right: 16),
              child: CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(
                    "https://scontent.fsgn2-1.fna.fbcdn.net/v/t39.30808-6/308505217_1594721400924906_3025204205154832825_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=2lJNGFkqN3MAX95hzcy&tn=MMQY6WMhs1Yzm49w&_nc_ht=scontent.fsgn2-1.fna&oh=00_AT-7ehVgitOfs9wIgkFlO58xGwK9IcqyoInjUVz_jeQ75g&oe=633D3EFE"),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Report",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 4,
                ),
              ],
            ),
          ],
        ));
  }

  Widget _topBar() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Container(
          //   child: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
          // ),
          // Container(
          //     child: IconButton(onPressed: () {}, icon: Icon(Icons.settings)))
        ],
      ),
    );
  }
}
