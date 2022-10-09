import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fruity/data/network/rest_client.dart';
import 'package:fruity/data/sharedpref/constants/preferences.dart';
import 'package:fruity/models/mark/mark.dart';
import 'package:fruity/models/subject/subject.dart';
import 'package:fruity/models/user/student.dart';
import 'package:fruity/models/user/user.dart';
import 'package:fruity/utils/datetime_util.dart';
import 'package:fruity/utils/notify_util.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  User? _user = User("", "", "", "", "",
      Student("", "", "", new DateTime(2022), null, null, null), null, null);
  Student _student = Student("", "", "", new DateTime(2022), null, null, null);
  bool isInProgress = false;
  bool isParent = false;
  List<Subject> _subjects = [];
  List<Mark> _marks = [];
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
      await RestClient().get("/mark", headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      }).then((value) async {
        final parsed = jsonDecode(value.body);
        setState(() {
          _marks = parsed
              .map<Mark>((json) => Mark.fromJson(json as Map<String, dynamic>))
              .toList() as List<Mark>;
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
          Container(
            height: 200,
            width: double.infinity,
            child: ListView.builder(
              itemCount: _marks.length,
              itemBuilder: (context, index) {
                if (index > maxLenght) {
                  return Container();
                }
                return Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _marks[index].exam!,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        _marks[index].score.toString(),
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    ));
  }

  Widget _process() {
    return IntrinsicHeight(
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            height: 200,
            child: ListView.builder(
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
    double percent = _random.nextDouble();
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
                  percent: percent,
                  center: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          (percent * 100).toStringAsFixed(0) + "%",
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
                    _subjects[index].name!,
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
                  "Parent of " + _student.name!,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      wordSpacing: 2),
                )
              : Text(
                  _user!.student!.name!,
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
                    backgroundImage:
                        NetworkImage("https://i.stack.imgur.com/l60Hf.png"),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
