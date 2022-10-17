import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fruity/data/network/rest_client.dart';
import 'package:fruity/data/sharedpref/constants/preferences.dart';
import 'package:fruity/models/user/user.dart';
import 'package:fruity/ui/personal/change_password.dart';
import 'package:fruity/utils/notify_util.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  late bool showPassword = false;
  late bool isInProgress = false;
  User? _user = User("", "", "", "", "", "", null, null, null);
  late TextEditingController studentId;
  late TextEditingController name;
  late TextEditingController avatarLink;
  late TextEditingController address;
  late TextEditingController birthday;
  late TextEditingController phone;
  late TextEditingController id;
  String type = "";
  @override
  void initState() {
    super.initState();
    _paserUser();
    studentId = TextEditingController();
    name = TextEditingController();
    avatarLink = TextEditingController();
    phone = TextEditingController();
    address = TextEditingController();
    birthday = TextEditingController();
    id = TextEditingController();
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
        type = user.type!;
        if (type == "student" && user.student != null) {
          name.text = user.student!.name ?? "";
          address.text = user.student!.address ?? "";
          birthday.text = user.student!.birthday != null
              ? user.student!.birthday.toString()
              : "";
          id.text = user.student!.parentsId ?? "";
        }
        if (type == "parents") {
          id.text = user.id;
          avatarLink.text = user.avatar ?? "";
        }
        if (type == "teacher" && user.teacher != null) {
          name.text = user.teacher!.name ?? "";
          phone.text = user.teacher!.phone ?? "";
          avatarLink.text = user.avatar ?? "";
        }
      });
    }
  }

  Future _updateStudent() async {
    setState(() {
      isInProgress = true;
    });
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString(Preferences.token);
    if (name.text.isNotEmpty &&
        address.text.isNotEmpty &&
        birthday.text.isNotEmpty) {
      await RestClient().put("/student/me", headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      }, body: {
        "name": name.text,
        "address": address.text,
        "birthday": DateTime.parse(birthday.text).toIso8601String(),
        "parentsId": id.text
        // "avatar": avatarLink.text,
      }).then((value) async {
        print(value.body);
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
      NotifyHelper.error(context, "Please fill all fields");
    }
  }

  Future _updateParent() async {
    setState(() {
      isInProgress = true;
    });
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString(Preferences.token);
    await RestClient().put("/parents/me", headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    }, body: {
      "avatar": avatarLink.text,
    }).then((value) async {
      print(value.body);
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
  }

  Future _updateTeacher() async {
    setState(() {
      isInProgress = true;
    });
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString(Preferences.token);
    if (name.text.isNotEmpty && phone.text.isNotEmpty) {
      await RestClient().put("/teacher/me", headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      }, body: {
        "name": name.text,
        "phone": phone.text,
        // "avatar": avatarLink.text,
      }).then((value) async {
        print(value.body);
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
      NotifyHelper.error(context, "Please fill all fields");
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
        body: Container(color: Colors.white30, child: makeForm()));
  }

  Widget makeForm() {
    if (type == 'student') {
      return ListView(
        children: <Widget>[
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
              controller: name,
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(24, 16, 24, 0),
            child: TextFormField(
              obscureText: showPassword,
              decoration: InputDecoration(
                hintText: "Address",
                isDense: true,
                contentPadding: EdgeInsets.all(12),
                prefixIcon: Icon(
                  Icons.location_on,
                  size: 22,
                ),
              ),
              controller: address,
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(24, 16, 24, 0),
            child: TextFormField(
              obscureText: showPassword,
              decoration: InputDecoration(
                hintText: "Birthday",
                isDense: true,
                contentPadding: EdgeInsets.all(12),
                prefixIcon: Icon(
                  Icons.date_range,
                  size: 22,
                ),
              ),
              controller: birthday,
              readOnly:
                  true, //set it true, so that user will not able to edit text
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate:
                        DateTime.tryParse(birthday.text) ?? DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2101));
                if (pickedDate != null) {
                  String formattedDate = pickedDate.toIso8601String();
                  setState(() {
                    birthday.text =
                        formattedDate; //set output date to TextField value.
                  });
                } else {
                  print("Date is not selected");
                }
              },
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(24, 16, 24, 0),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: "Your Parent Id",
                isDense: true,
                contentPadding: EdgeInsets.all(12),
                prefixIcon: Icon(
                  Icons.person,
                  size: 22,
                ),
              ),
              controller: id,
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
                  onPressed: isInProgress ? () {} : () => {_updateStudent()},
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
                  onPressed: isInProgress
                      ? () {}
                      : () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ChangePasswordScreen()))
                          },
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
                                "Change Password or Avatar".toUpperCase(),
                              ),
                      ),
                    ],
                  ),
                ),
              )),
        ],
      );
    }
    if (type == 'parents') {
      return ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(24, 16, 24, 0),
            child: TextFormField(
              enabled: false,
              decoration: InputDecoration(
                hintText: "Your ID",
                isDense: true,
                contentPadding: EdgeInsets.all(12),
                prefixIcon: Icon(
                  Icons.person,
                  size: 22,
                ),
              ),
              controller: id,
              onTap: () async {
                await Clipboard.setData(ClipboardData(text: id.text));
                NotifyHelper.info(context, "Copied to clipboard");
              },
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
                  onPressed: isInProgress ? () {} : () => {_updateParent()},
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
                  onPressed: isInProgress
                      ? () {}
                      : () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ChangePasswordScreen()))
                          },
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
                                "Change Password or Avatar".toUpperCase(),
                              ),
                      ),
                    ],
                  ),
                ),
              )),
        ],
      );
    }
    if (type == "teacher") {
      return ListView(
        children: <Widget>[
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
              controller: name,
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(24, 16, 24, 0),
            child: TextFormField(
              obscureText: showPassword,
              decoration: InputDecoration(
                hintText: "Phone Number",
                isDense: true,
                contentPadding: EdgeInsets.all(12),
                prefixIcon: Icon(
                  Icons.phone,
                  size: 22,
                ),
              ),
              controller: phone,
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
                  onPressed: isInProgress ? () {} : () => {_updateTeacher()},
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
                  onPressed: isInProgress
                      ? () {}
                      : () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ChangePasswordScreen()))
                          },
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
                                "Change Password or Avatar".toUpperCase(),
                              ),
                      ),
                    ],
                  ),
                ),
              )),
        ],
      );
    }
    return Container();
  }
}
