import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fruity/data/network/rest_client.dart';
import 'package:fruity/data/sharedpref/constants/preferences.dart';
import 'package:fruity/models/user/user.dart';
import 'package:fruity/utils/notify_util.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChangePasswordScreen extends StatefulWidget {
  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  late bool showPassword = false;
  late bool isInProgress = false;
  User? _user = User("", "", "", "", "", "", null, null, null);
  late TextEditingController password;
  late TextEditingController retypePassword;
  late TextEditingController avatarLink;
  @override
  void initState() {
    super.initState();
    _paserUser();
    avatarLink = TextEditingController();
    password = TextEditingController();
    retypePassword = TextEditingController();
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
    }
  }

  Future _updateInfo() async {
    setState(() {
      isInProgress = true;
    });
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString(Preferences.token);
    if (password.text == retypePassword.text && password.text.length >= 6) {
      await RestClient().put("/auth/me", headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      }, body: {
        "password": password.text,
        "avatar": avatarLink.text,
      }).then((value) async {
        Navigator.pop(context);
        _paserUser();
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
    } else {
      setState(() {
        isInProgress = false;
      });
      NotifyHelper.error(context, "Invalid field");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Change Indentity'),
          centerTitle: true,
        ),
        resizeToAvoidBottomInset: false,
        body: Container(color: Colors.white30, child: makeForm()));
  }

  Widget makeForm() {
    return ListView(
      children: <Widget>[
        Container(
          margin: EdgeInsets.fromLTRB(24, 16, 24, 0),
          child: TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              hintText: "New Password",
              isDense: true,
              contentPadding: EdgeInsets.all(12),
              prefixIcon: Icon(
                Icons.person,
                size: 22,
              ),
            ),
            controller: password,
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(24, 16, 24, 0),
          child: TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              hintText: "Retype Password",
              isDense: true,
              contentPadding: EdgeInsets.all(12),
              prefixIcon: Icon(
                Icons.location_on,
                size: 22,
              ),
            ),
            controller: retypePassword,
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
                Icons.date_range,
                size: 22,
              ),
            ),
            controller: avatarLink,
          ),
        ),
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
                onPressed: isInProgress ? () {} : () => {_updateInfo()},
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
    );
  }
}
