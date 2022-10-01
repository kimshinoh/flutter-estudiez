import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruity/utils/Validator.dart';
import 'package:fruity/utils/notify_util.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreen createState() => _RegisterScreen();
}

class _RegisterScreen extends State<RegisterScreen> {
  late bool showPassword = false;
  late bool isInProgress = false;
  late TextEditingController emailTFController;
  late TextEditingController passwordTFController;
  late TextEditingController nameTFController;

  //Global Keys
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final List<Map<String, String>> typesUser = [
    {"name": "Parent/Guardian", "value": "parent"},
    {"name": "Admin", "value": "admin"},
    {"name": "Student", "value": "student"},
    {"name": "Teacher", "value": "teacher"},
  ];
  @override
  void initState() {
    super.initState();
    nameTFController = TextEditingController();
    emailTFController = TextEditingController();
    passwordTFController = TextEditingController();
  }

  _handleRegister() async {
    String username = nameTFController.text;
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

      // await Future.delayed(Duration(seconds: 1), () {
      //   if (mounted) {
      //     setState(() {
      //       isInProgress = false;
      //     });
      //   }
      //   Navigator.pushReplacement(
      //     context,
      //     MaterialPageRoute(
      //       builder: (BuildContext context) => AppScreen(),
      //     ),
      //   );
      // });
    }
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
                      "Create New Account".toUpperCase(),
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
                    // controller: emailTFController,
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
                    // controller: passwordTFController,
                    keyboardType: TextInputType.visiblePassword,
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(24, 16, 24, 0),
                  child: TextFormField(
                    obscureText: showPassword,
                    decoration: InputDecoration(
                      hintText: "Confirm Password",
                      isDense: true,
                      contentPadding: EdgeInsets.all(12),
                      prefixIcon: Icon(
                        Icons.password,
                        size: 22,
                      ),
                      // suffixIcon: InkWell(
                      //   onTap: () {
                      //     setState(() {
                      //       showPassword = !showPassword;
                      //     });
                      //   },
                      //   child: Icon(
                      //     showPassword
                      //         ? Icons.visibility
                      //         : Icons.visibility_off,
                      //     size: 22,
                      //   ),
                      // ),
                    ),
                    controller: passwordTFController,
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(24, 10, 24, 0),
                  height: 50,
                  padding: EdgeInsets.only(top: 12),
                  child: DropdownButtonFormField(
                    isExpanded: true,
                    hint: Text(
                      "User Type",
                    ),
                    items: typesUser.map((Map<String, String> value) {
                      return DropdownMenuItem<String>(
                        value: value["value"],
                        child: Text(value["name"]!),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      print(value);
                    },
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.only(right: 16),
                      prefixIcon: Icon(
                        Icons.account_circle_outlined,
                        size: 22,
                      ),
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
                        onPressed:
                            isInProgress ? () {} : () => _handleRegister(),
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
                                      "Sign up".toUpperCase(),
                                    ),
                            ),
                          ],
                        ),
                      ),
                    )),
                Center(
                  child: Container(
                    margin: EdgeInsets.only(top: 16),
                    child: Text(
                      "By sign up you agree to our terms and conditions",
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
