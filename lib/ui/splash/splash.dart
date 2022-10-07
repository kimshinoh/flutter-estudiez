import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fruity/constants/assest.dart';
import 'package:fruity/widgets/bottom_bar.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // late AuthStore _store;
  @override
  void initState() {
    super.initState();
    // _store = context.read<AuthStore>();
    startTimer();
  }

  void startTimer() {
    const Duration _duration = Duration(seconds: 2);
    Timer(_duration, _navigate);
  }

  Future<void> _navigate() async {
    // final SharedPreferences _preferences =
    //     await SharedPreferences.getInstance();
    // final UserLoginResponseDTO? res =
    //     UserLoginResponseDTO.fromPrefs(_preferences);

    // if (res != null) {
    //   // _store.setAuth(res);
    // }

    await Future<void>.delayed(const Duration(seconds: 1));
    if (!mounted) {
      return;
    }

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (BuildContext context) => const MyBottombar(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Material(
      child: FittedBox(
        fit: BoxFit.fill,
        child: Image(
          width: size.width,
          image: const AssetImage(
            Assets.splash,
          ),
        ),
      ),
    );
  }
}
