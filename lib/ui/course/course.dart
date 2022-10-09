import 'dart:convert';

import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:fruity/data/network/rest_client.dart';
import 'package:fruity/data/sharedpref/constants/preferences.dart';
import 'package:fruity/models/resource/resource.dart';
import 'package:fruity/utils/notify_util.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class CourseScreen extends StatefulWidget {
  final String subjectId;
  const CourseScreen({Key? key, required this.subjectId}) : super(key: key);

  @override
  State<CourseScreen> createState() => _CourseScreen();
}

class _CourseScreen extends State<CourseScreen> {
  bool _isPlayerReady = false;
  late List<Resource> _resources = [];
  late String _subjectId;
  bool isLoading = true;

  _getInfoResource() async {
    setState(() {
      isLoading = true;
    });
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    var token = await _preferences.getString(Preferences.token);
    await RestClient().get("/resource/subject-class/633459c42103f884c90a25fa",
        headers: {
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
  void initState() {
    super.initState();
    _subjectId = widget.subjectId;
    _getInfoResource();
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
          : ListView.builder(
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
                      height: 200,
                      width: double.infinity,
                      child: InkWell(
                        onTap: () {
                          launchUrlString(_resources[index].link!);
                        },
                        child: Text(_resources[index].link!,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            )),
                      ),
                    ),
                  ],
                );
              }),
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
                backgroundImage:
                    NetworkImage("https://i.stack.imgur.com/l60Hf.png"),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Nguyen Van A",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  "01325468975",
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
                  "Class 6",
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
            child: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
          ),
        ],
      ),
    );
  }
}
