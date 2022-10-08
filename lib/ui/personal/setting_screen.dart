import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fruity/data/sharedpref/constants/preferences.dart';
import 'package:fruity/models/user/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  late bool showPassword = false;
  late bool isInProgress = false;
  User? _user = User("", "", "", "", "", null, null, null);
  late TextEditingController studentId;
  late TextEditingController displayName;
  late TextEditingController avatarLink;
  late TextEditingController phone;
  @override
  void initState() {
    super.initState();
    studentId = TextEditingController();
    displayName = TextEditingController();
    avatarLink = TextEditingController();
    phone = TextEditingController();
    _paserUser();
  }

  _paserUser() async {
    final SharedPreferences _preferences =
        await SharedPreferences.getInstance();
    String? _userString = _preferences.getString(Preferences.user);
    if (_userString != null) {
      final parsed = jsonDecode(_userString) as Map<String, dynamic>;
      print(_userString);
      User user = User.fromJson(parsed);
      setState() {
        _user = user;
      }

      if (user.type == "parent") {
        // studentId.text = user.email;
        displayName.text = user.parents!.name!;
        phone.text = user.parents!.address!;
      }
      if (user.type == "student") {
        // studentId.text = user.email;
        displayName.text = user.student!.name!;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Setting'),
          centerTitle: true,
        ),
        resizeToAvoidBottomInset: false,
        body: Container(
          color: Colors.white30,
          child: ListView(
            children: <Widget>[
              if (_user!.type == "parent")
                Container(
                  margin: EdgeInsets.fromLTRB(24, 24, 24, 0),
                  child: TextFormField(
                    enabled: false,
                    decoration: const InputDecoration(
                        alignLabelWithHint: true,
                        hintText: "Your Student Id",
                        prefixIcon: Icon(
                          Icons.card_membership,
                          size: 20,
                        ),
                        isDense: true,
                        contentPadding: EdgeInsets.all(12)),
                    controller: studentId,
                  ),
                ),
              Container(
                margin: EdgeInsets.fromLTRB(24, 16, 24, 0),
                child: TextFormField(
                  obscureText: showPassword,
                  decoration: InputDecoration(
                    hintText: "Display Name",
                    isDense: true,
                    contentPadding: EdgeInsets.all(12),
                    prefixIcon: Icon(
                      Icons.person,
                      size: 22,
                    ),
                  ),
                  controller: displayName,
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(24, 16, 24, 0),
                child: TextFormField(
                  obscureText: showPassword,
                  decoration: InputDecoration(
                    hintText: "Avatar Link",
                    isDense: true,
                    contentPadding: EdgeInsets.all(12),
                    prefixIcon: Icon(
                      Icons.link,
                      size: 22,
                    ),
                  ),
                  controller: avatarLink,
                ),
              ),
              // Container(
              //   margin: EdgeInsets.fromLTRB(24, 16, 24, 0),
              //   child: TextFormField(
              //     obscureText: showPassword,
              //     decoration: InputDecoration(
              //       hintText: "Phone Number",
              //       isDense: true,
              //       contentPadding: EdgeInsets.all(12),
              //       prefixIcon: Icon(
              //         Icons.phone,
              //         size: 22,
              //       ),
              //     ),
              //     controller: phone,
              //   ),
              // ),
              Container(
                  margin: EdgeInsets.fromLTRB(24, 24, 24, 0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(48)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blue.shade400,
                          blurRadius: 5,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      color: Colors.blue.shade400,
                      highlightColor: Colors.blue.shade600,
                      splashColor: Colors.white.withAlpha(100),
                      padding: EdgeInsets.only(top: 16, bottom: 16),
                      onPressed: isInProgress ? () {} : () => {},
                      child: Stack(
                        // overflow: Overflow.visible,
                        alignment: Alignment.center,
                        children: <Widget>[
                          Align(
                            alignment: Alignment.center,
                            child: isInProgress
                                ? Container(
                                    width: 20,
                                    height: 20,
                                    child: const CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        Colors.white,
                                      ),
                                    ),
                                  )
                                : Text(
                                    "Save".toUpperCase(),
                                  ),
                          ),
                        ],
                      ),
                    ),
                  )),
            ],
          ),
        ));
  }
}
