import 'dart:convert';

import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:fruity/data/network/rest_client.dart';
import 'package:fruity/data/sharedpref/constants/preferences.dart';
import 'package:fruity/models/resource/resource.dart';
import 'package:fruity/models/subject/subjectClass.dart';
import 'package:fruity/models/user/student.dart';
import 'package:fruity/models/user/user.dart';
import 'package:fruity/utils/notify_util.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class CourseScreen extends StatefulWidget {
  final SubjectClass subject;
  const CourseScreen({Key? key, required this.subject}) : super(key: key);

  @override
  State<CourseScreen> createState() => _CourseScreen();
}

class _CourseScreen extends State<CourseScreen> {
  bool _isPlayerReady = false;
  late List<Resource> _resources = [];
  late SubjectClass _subject;
  bool isLoading = true;
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
  @override
  void initState() {
    super.initState();
    _subject = widget.subject;
    _getInfoResource();
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
      });
    }
  }

  _getInfoResource() async {
    setState(() {
      isLoading = true;
    });
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    var token = await _preferences.getString(Preferences.token);
    String id = _subject.id;
    await RestClient().get("/resource/subject-class/$id", headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    }).then((value) async {
      final parsed = jsonDecode(value.body);
      setState(() {
        _resources = parsed
            .map<Resource>(
                (json) => Resource.fromJson(json as Map<String, dynamic>))
            .toList() as List<Resource>;
      });
    }).catchError((error) {
      print(error);
      NotifyHelper.error(context, "Something went wrong");
    }).whenComplete(() {
      if (mounted) {
        setState(() {
          isLoading = false;
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
                    // const SizedBox(height: 20),
                    // _exam(),
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
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
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
      child: isLoading
          ? const Center(child: CircularProgressIndicator())
          : _resources.length > 0
              ? ListView.builder(
                  itemCount: _resources.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _resources[index].name!,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          height: 100,
                          width: double.infinity,
                          child: InkWell(
                            onTap: () {
                              launchUrlString(_resources[index].link!);
                            },
                            child: Text(_resources[index].link!,
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue,
                                )),
                          ),
                        ),
                      ],
                    );
                  })
              : const Center(child: Text("No resource")),
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
                    _user!.avatar ?? "https://i.stack.imgur.com/l60Hf.png"),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _subject.name,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  _subject.code!,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      wordSpacing: 2),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  _subject.teacher ?? "",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      wordSpacing: 2),
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
          Container(
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back)),
          ),
        ],
      ),
    );
  }
}
