import 'package:json_annotation/json_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  User({required this.id, required this.fullName, required this.phoneNumber});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  factory User.fromPrefs(SharedPreferences prefs) {
    return User(
        id: prefs.getString('id') ?? '',
        fullName: prefs.getString('fullName') ?? '',
        phoneNumber: prefs.getString('phoneNumber') ?? '',);
  }

  Map<String, dynamic> toJson() => _$UserToJson(this);

  void saveToPrefs(SharedPreferences prefs) {
    prefs.setString('id', id);
    prefs.setString('fullName', fullName);
    prefs.setString('phoneNumber', phoneNumber);
  }

  String id;
  @JsonKey(name: 'full_name')
  String fullName;
  @JsonKey(name: 'phone_number')
  String phoneNumber;
  String? email;
}
