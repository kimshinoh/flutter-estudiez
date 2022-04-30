import 'dart:convert';

import 'package:fruity/data/sharedpref/constants/preferences.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  User({required this.id, required this.fullName, required this.phoneNumber});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  static User? fromPrefs(SharedPreferences prefs) {
    const JsonDecoder _decoder = JsonDecoder();

    final Map<String, dynamic> _userJson =
        json.decode(prefs.getString(Preferences.user) ?? '{}')
            as Map<String, dynamic>;

    if (_userJson['id'] == null) {
      return null;
    }
    return User(
      id: _userJson['id'].toString(),
      fullName: _userJson['fullName'].toString(),
      phoneNumber: _userJson['phoneNumber'].toString(),
    );
  }

  Map<String, dynamic> toJson() => _$UserToJson(this);

  void saveToPrefs(SharedPreferences prefs) {
    final Map<String, String> user = <String, String>{};
    user['id'] = id;
    user['fullName'] = fullName;
    user['phoneNumber'] = phoneNumber;
    if (user.isNotEmpty) {
      prefs.setString(Preferences.user, json.encode(user));
    }
  }

  static void clearPrefs(SharedPreferences prefs) {
    prefs.remove(Preferences.user);
  }

  String id;
  @JsonKey(name: 'full_name')
  String fullName;
  @JsonKey(name: 'phone_number')
  String phoneNumber;
  String? email;

  String avatarUrl = 'https://i.imgur.com/EYdQnGt.jpeg';
}
