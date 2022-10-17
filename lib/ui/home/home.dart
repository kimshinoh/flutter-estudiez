import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fruity/data/network/rest_client.dart';
import 'package:fruity/data/sharedpref/constants/preferences.dart';
import 'package:fruity/models/mark/cook_mark.dart';
import 'package:fruity/models/mark/mark.dart';
import 'package:fruity/models/subject/subject.dart';
import 'package:fruity/models/user/student.dart';
import 'package:fruity/models/user/user.dart';
import 'package:fruity/utils/datetime_util.dart';
import 'package:fruity/utils/notify_util.dart';
import 'package:fruity/utils/string.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Item {
  Item({
    required this.expandedValue,
    required this.headerValue,
    this.isExpanded = false,
  });

  Widget expandedValue;
  String headerValue;
  bool isExpanded;
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  User? _user = User(
      "",
      "",
      "",
      "",
      "",
      "",
      Student("", "", "", new DateTime(2022), null, null, "", null),
      null,
      null);
  Student _student =
      Student("", "", "", new DateTime(2022), null, null, "", null);
  bool isInProgress = false;
  bool isParent = false;
  List<Subject> _subjects = [];
  List<CookMark> _marks = [];
  List<Item> _data = [];
  int maxLenght = 10;
  @override
  void initState() {
    super.initState();
    _paserUser();
  }

  final _random = new Random();

  _paserUser() async {
    final SharedPreferences _preferences =
        await SharedPreferences.getInstance();
    String? _userString = _preferences.getString(Preferences.user);
    var token = await _preferences.getString(Preferences.token);
    if (_userString != null) {
      final parsed = jsonDecode(_userString) as Map<String, dynamic>;
      User user = User.fromJson(parsed);
      if (user.type == "parents") {
        String body = await _getInfoStudent();
        setState(() {
          _student = Student.fromJson(
              jsonDecode(body)['student'][0] as Map<String, dynamic>);
          isParent = true;
          // _user = student;
        });
      }
      setState(() {
        _user = user;
      });
      await RestClient().get("/subject", headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      }).then((value) async {
        final parsed = jsonDecode(value.body);
        setState(() {
          _subjects = parsed
              .map<Subject>(
                  (json) => Subject.fromJson(json as Map<String, dynamic>))
              .toList() as List<Subject>;
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
      String studentId = isParent
          ? _student.id
          : _user!.student != null
              ? _user!.student!.id
              : "";
      await RestClient().get("/mark/student/$studentId", headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      }).then((value) async {
        final parsed = jsonDecode(value.body);
        List<Mark> _rawMarks = parsed
            .map<Mark>((json) => Mark.fromJson(json as Map<String, dynamic>))
            .toList() as List<Mark>;
        List<CookMark> _cookMarks = [];
        // group mark by subject and sort by created At desc
        _rawMarks.sort((a, b) => b.createdAt!.compareTo(a.createdAt!));
        _rawMarks.forEach((element) {
          if (_cookMarks.length == 0) {
            _cookMarks
                .add(CookMark(element.subject, element.subjectId, [element]));
          } else {
            bool isExist = false;
            _cookMarks.forEach((cookMark) {
              if (cookMark.subject == element.subject) {
                isExist = true;
                cookMark.marks.add(element);
              }
            });
            if (!isExist) {
              _cookMarks
                  .add(CookMark(element.subject, element.subjectId, [element]));
            }
          }
        });
        setState(() {
          _marks = _cookMarks;
          _data = _cookMarks
              .map((cookMark) => Item(
                  isExpanded: false,
                  headerValue: cookMark.subject ?? "Unknown",
                  expandedValue: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    height: 100,
                    width: double.infinity,
                    child: ListView.builder(
                        itemCount: cookMark.marks.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(cookMark.marks[index].exam ?? "Unknown"),
                                Text(cookMark.marks[index].score.toString() ??
                                    "Unknown"),
                              ]);
                        }),
                  )))
              .toList();
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
  }

  Future<String> _getInfoStudent() async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    var token = await _preferences.getString(Preferences.token);
    return RestClient().get("/parents/me", headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    }).then((value) async {
      return value.body;
    }).catchError((error) {
      NotifyHelper.error(context, "Something went wrong");
      return "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Container(
                padding: const EdgeInsets.fromLTRB(16, 30, 16, 0),
                // decoration: BoxDecoration(
                //   color: Colors.grey.shade200,
                // ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _topBar(),
                    _welcomeText(),
                    const SizedBox(height: 20),
                    _process(),
                    const SizedBox(height: 20),
                    _exam(),
                  ],
                ))));
  }

  Widget _exam() {
    return Expanded(
        child: Container(
      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.circular(20),
      //   color: Colors.white,
      // ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
              child: Text(
            'Summary',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          )),
          const SizedBox(height: 10),
          Expanded(
              child: Container(
            width: double.infinity,
            child: _marks.length == 0
                ? Center(
                    child: Text("No data"),
                  )
                : SingleChildScrollView(
                    child: Container(
                    child: ExpansionPanelList(
                      expansionCallback: (int index, bool isExpanded) {
                        setState(() {
                          _data[index].isExpanded = !isExpanded;
                        });
                      },
                      children: _data.map<ExpansionPanel>((Item item) {
                        return ExpansionPanel(
                          headerBuilder:
                              (BuildContext context, bool isExpanded) {
                            return ListTile(
                              title: Text(item.headerValue),
                            );
                          },
                          body: item.expandedValue,
                          isExpanded: item.isExpanded,
                        );
                      }).toList(),
                    ),
                  )),
          ))
        ],
      ),
    ));
  }

  Widget _process() {
    return IntrinsicHeight(
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            height: 200,
            child: _subjects.length == 0
                ? Center(
                    child: Text("No data"),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: _subjects.length,
                    itemBuilder: (BuildContext context, int index) {
                      // final Product _product = _productStore.productsSaleShock[index];
                      return InkWell(
                        onTap: () {},
                        child: _cardProcess(index),
                      );
                    },
                  )));
  }

  Widget _cardProcess(int index) {
    Subject currentSubject = _subjects[index];

    CookMark currentMark = _marks.firstWhere(
        (element) => element.subjectId == currentSubject.id,
        orElse: () => CookMark("", "", []));
    List<Mark> mark = currentMark.marks;
    double averageScore = 0;
    mark.forEach((element) {
      averageScore += element.score!;
    });
    averageScore = averageScore / mark.length;
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        padding: EdgeInsets.all(10),
        width: 130,
        decoration: const BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          image: DecorationImage(
            image: AssetImage("assets/images/card.jpg"),
            fit: BoxFit.fitHeight,
          ),
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Center(
                child: CircularPercentIndicator(
                  radius: 35,
                  lineWidth: 5,
                  animation: true,
                  //random percent
                  percent: averageScore / 10,
                  center: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          StringHelper.maxLength((averageScore * 10).toString(), 5) + "%",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12.0),
                        ),
                        Text(
                          "Percent",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12.0),
                        )
                      ]),
                  circularStrokeCap: CircularStrokeCap.round,
                  progressColor: Colors.blue.shade500,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _subjects[index].name ?? "Unknown",
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 16.0,
                      color: Colors.white,
                    ),
                    maxLines: 3,
                  ),
                  Text(
                    "CNTT",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    DateTimeHelper.formatDate(
                        _subjects[index].createdAt, "dd/MM/yyyy"),
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 16.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              )
            ]));
  }

  Widget _welcomeText() {
    return Container(
      margin: const EdgeInsets.only(top: 24),
      padding: const EdgeInsets.only(left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Hello,",
            style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 8,
          ),
          isParent
              ? Text(
                  "Parent of " + (_student.name ?? "Unknown"),
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      wordSpacing: 2),
                )
              : Text(
                  _user!.student != null
                      ? _user!.student!.name ?? "Unknown"
                      : "Unknown",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      wordSpacing: 2),
                ),
        ],
      ),
    );
  }

  Widget _topBar() {
    return Container(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            children: [
              Container(
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.notifications_none_outlined),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  margin: EdgeInsets.only(right: 16),
                  child: CircleAvatar(
                    radius: 16,
                    backgroundImage: NetworkImage(
                        _user!.avatar ?? "https://i.stack.imgur.com/l60Hf.png"),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  List<Item> generateItems() {
    return List<Item>.generate(_marks.length, (int index) {
      return Item(
          headerValue: _marks[index].subject ?? "Unknown",
          expandedValue: Container(
            height: 100,
            width: double.infinity,
            child: ListView.builder(
                itemCount: _marks[index].marks.length,
                itemBuilder: (BuildContext context, int index) {
                  return Row(children: [
                    Text(_marks[index].marks[index].name ?? "Unknown"),
                    Text(_marks[index].marks[index].score.toString() ??
                        "Unknown"),
                  ]);
                }),
          ));
    });
  }
}
