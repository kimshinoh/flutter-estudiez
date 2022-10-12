import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fruity/data/sharedpref/constants/preferences.dart';
import 'package:fruity/models/user/student.dart';
import 'package:fruity/models/user/user.dart';
import 'package:fruity/routes.dart';
import 'package:fruity/ui/auth/login.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

AppBar PersonalAppBar() {
  return AppBar(
    backgroundColor: Colors.blue.shade400,
    toolbarHeight: 60, // Set this height
    title: Builder(
      builder: (BuildContext context) {
        // AuthStore _store = context.read<AuthStore>();
        return Observer(builder: (_) {
          return GestureDetector(
            key: const Key('setting_btn'),
            onTap: () {
              showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                        title: const Text('Logout'),
                        content: const Text('Are you sure?'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text(
                              'Cancel',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                          TextButton(
                            onPressed: () async {
                              final SharedPreferences _preferences =
                                  await SharedPreferences.getInstance();
                              await _preferences.clear();

                              Navigator.of(context, rootNavigator: true).pushReplacement(MaterialPageRoute(builder: (context) => new LoginScreen()));
                            },
                            child: const Text('Logout'),
                          ),
                        ],
                      ));
            },
            child: SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const UserTextInfo(),
                  const SizedBox(
                    width: 10,
                  ),
                  UserAvatar(),
                ],
              ),
            ),
          );
        });
      },
    ),
  );
}

class UserTextInfo extends StatefulWidget {
  const UserTextInfo({Key? key}) : super(key: key);
  @override
  State<UserTextInfo> createState() => _UserTextInfoState();
}

class _UserTextInfoState extends State<UserTextInfo> {
  User? _user = User("", "", "", "", "",
      Student("", "", "", new DateTime(2022), null, null, null), null, null);
  @override
  void initState() {
    super.initState();
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

  @override
  Widget build(BuildContext context) {
    // AuthStore _store = context.read<AuthStore>();

    return Observer(
      builder: (_) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _user!.name ?? "",
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
          ],
        );
      },
    );
  }
}

class UserAvatar extends StatelessWidget {
  UserAvatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // AuthStore _store = context.read<AuthStore>();

    return Observer(builder: (_) {
      // User? user = _store.user;
      return Avatar(
        imageUrl:
            'https://upload.wikimedia.org/wikipedia/vi/thumb/e/ef/Logo_%C4%90%E1%BA%A1i_h%E1%BB%8Dc_B%C3%A1ch_Khoa_H%C3%A0_N%E1%BB%99i.svg/1365px-Logo_%C4%90%E1%BA%A1i_h%E1%BB%8Dc_B%C3%A1ch_Khoa_H%C3%A0_N%E1%BB%99i.svg.png',
      );
    });
  }
}

class Avatar extends StatelessWidget {
  String imageUrl;
  Size size;
  Avatar({Key? key, required this.imageUrl, this.size = const Size(40, 40)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: size.height,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.white,
        ),
        image: DecorationImage(
          image: NetworkImage(imageUrl.isNotEmpty
              ? imageUrl
              : 'https://i.imgur.com/EYdQnGt.jpeg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
