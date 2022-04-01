import 'dart:async';

import 'package:fruity/data/sharedpref/constants/preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper {
  // shared pref instance
  SharedPreferenceHelper(this._sharedPreference);
  final SharedPreferences _sharedPreference;

  // constructor

  // General Methods: ----------------------------------------------------------
  Future<String?> get token async {
    return _sharedPreference.getString(Preferences.token);
  }

  Future<bool> saveAuthToken(String authToken) async {
    return _sharedPreference.setString(Preferences.token, authToken);
  }

  Future<bool> removeAuthToken() async {
    return _sharedPreference.remove(Preferences.token);
  }

  // Login:---------------------------------------------------------------------
  Future<bool> get isLoggedIn async {
    return _sharedPreference.getBool(Preferences.isLoggedIn) ?? false;
  }

  Future<bool> saveIsLoggedIn({required bool isLoggedIn}) async {
    return _sharedPreference.setBool(Preferences.isLoggedIn, isLoggedIn);
  }
}
