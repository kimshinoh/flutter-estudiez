import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fruity/constants/app_color.dart';
import 'package:fruity/data/sharedpref/constants/preferences.dart';
import 'package:fruity/models/user/student.dart';
import 'package:fruity/models/user/user.dart';
import 'package:fruity/routes.dart';
import 'package:fruity/ui/personal/widgets/personal_header.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher_string.dart';

class PersonalScreen extends StatefulWidget {
  PersonalScreen({Key? key}) : super(key: key);

  @override
  State<PersonalScreen> createState() => _PersonalScreenState();
}

class _PersonalScreenState extends State<PersonalScreen> {
  String SUPPORT_PHONE_NUMBER = '0123456789';
  User? _user = User("", "", "", "", "",
      Student("", "", "", new DateTime(2022), null, null, null), null, null);
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

  @override
  void initState() {
    super.initState();
    _paserUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PersonalAppBar(),
      body: ListView(
        children: [
          Container(
            width: double.infinity,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                children: [
                  const Divider(
                    color: Colors.white,
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 8,
                    ),
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        Routes.setting,
                      );
                    },
                    title: Row(
                      children: const [
                        Icon(
                          Icons.person_pin,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          'Your Information',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    color: Colors.white,
                    height: 30,
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 8,
                    ),
                    title: Row(
                      children: [
                        const Icon(
                          Icons.phone,
                          color: Colors.grey,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        const Expanded(
                          child: Text(
                            'Hotline',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        TextButton(
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              minimumSize: Size.zero,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            onPressed: () {
                              String url = 'tel:$SUPPORT_PHONE_NUMBER';
                              launchUrlString(url);
                            },
                            child: Text(SUPPORT_PHONE_NUMBER))
                      ],
                    ),
                  ),
                  const Divider(
                    color: Colors.white,
                    height: 30,
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 8,
                    ),
                    title: Row(
                      children: [
                        const Icon(
                          Icons.app_shortcut_rounded,
                          color: Colors.grey,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        const Expanded(
                          child: Text(
                            'App Version',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Text(
                          "1.0.0",
                          style: TextStyle(
                            color: AppColors.palette.shade500,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                  ),
                  const Divider(
                    color: Colors.white,
                    height: 30,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
