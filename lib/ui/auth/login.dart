import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruity/data/network/rest_client.dart';
import 'package:fruity/data/sharedpref/constants/preferences.dart';
import 'package:fruity/data/sharedpref/shared_preference_helper.dart';
import 'package:fruity/ui/auth/register.dart';
import 'package:fruity/ui/home/home.dart';
import 'package:fruity/utils/Validator.dart';
import 'package:fruity/utils/notify_util.dart';
import 'package:fruity/widgets/bottom_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late bool showPassword = false;
  late bool isInProgress = false;
  late TextEditingController emailTFController;
  late TextEditingController passwordTFController;
  @override
  void initState() {
    super.initState();
    emailTFController = TextEditingController();
    passwordTFController = TextEditingController();
  }

  _handleLogin() async {
    String email = emailTFController.text;
    String password = passwordTFController.text;
    if (email.isEmpty) {
      NotifyHelper.error(context, "Please Fill Email");
    } else if (Validator.isEmail(email)) {
      NotifyHelper.error(context, "Please fill email properly");
    } else if (password.isEmpty) {
      NotifyHelper.error(context, "Please fill password");
    } else {
      if (mounted) {
        setState(() {
          isInProgress = true;
        });
      }
      final SharedPreferences _preferences =
          await SharedPreferences.getInstance();
      await RestClient().post("/auth/login", headers: {
        "Content-Type": "application/json",
      }, body: {
        "email": email,
        "password": password
      }).then((value) async {
        if (value["statusCode"] == 200) {
          await SharedPreferenceHelper(_preferences)
              .saveAuthToken(value["data"]["access_token"] as String);
          String? userInfo = await _getInfoUser();
          _preferences.setString(Preferences.user, userInfo!);
          Navigator.of(context, rootNavigator: true).pushReplacement(
              MaterialPageRoute(
                  builder: (BuildContext context) => new MyBottombar()));
        } else {
          NotifyHelper.error(context, "Something went wrong");
        }
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

  Future<String?> _getInfoUser() async {
    final SharedPreferences _preferences =
        await SharedPreferences.getInstance();
    String? token = await _preferences.getString(Preferences.token);
    return RestClient().get("/auth/verify", headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    }).then((res) async {
      return res.body;
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
            color: Colors.white30,
            child: ListView(
              padding: const EdgeInsetsDirectional.only(top: 150),
              children: <Widget>[
                Center(
                  child: Container(
                    margin: EdgeInsetsDirectional.only(top: 24),
                    child: Text(
                      "Login".toUpperCase(),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(24, 24, 24, 0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                        alignLabelWithHint: true,
                        hintText: "Email Address",
                        prefixIcon: Icon(
                          Icons.email,
                          size: 20,
                        ),
                        isDense: true,
                        contentPadding: EdgeInsets.all(12)),
                    keyboardType: TextInputType.emailAddress,
                    controller: emailTFController,
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(24, 16, 24, 0),
                  child: TextFormField(
                    obscureText: !showPassword,
                    decoration: InputDecoration(
                      hintText: "Password",
                      prefixIcon: Icon(
                        Icons.password,
                        size: 22,
                      ),
                      suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            showPassword = !showPassword;
                          });
                        },
                        child: Icon(
                          showPassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                          size: 22,
                        ),
                      ),
                      isDense: true,
                      contentPadding: EdgeInsets.all(12),
                    ),
                    controller: passwordTFController,
                    keyboardType: TextInputType.visiblePassword,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(24, 8, 24, 0),
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {},
                    child: Text(
                      "Forgot Password",
                    ),
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
                        onPressed: isInProgress ? () {} : () => _handleLogin(),
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
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          Colors.white,
                                        ),
                                      ),
                                    )
                                  : Text(
                                      "Login".toUpperCase(),
                                    ),
                            ),
                          ],
                        ),
                      ),
                    )),
                Center(
                  child: Container(
                    margin: EdgeInsets.only(top: 16),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterScreen()));
                      },
                      child: Text(
                        "I have not an account",
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
