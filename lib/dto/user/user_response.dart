import 'package:fruity/data/sharedpref/constants/preferences.dart';
import 'package:fruity/models/user/user.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'user_response.g.dart';

@JsonSerializable(explicitToJson: true)
class UserLoginResponseDTO {
  UserLoginResponseDTO({this.user, this.token, this.expiredAt, this.error});

  factory UserLoginResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$UserLoginResponseDTOFromJson(json);

  factory UserLoginResponseDTO.withError(String error) =>
      UserLoginResponseDTO(error: error);

  factory UserLoginResponseDTO.fromPrefs(SharedPreferences prefs) {
    final _user = User.fromPrefs(prefs);

    return UserLoginResponseDTO(
      user: _user,
      expiredAt: prefs.getInt(Preferences.expiredAt),
      token: prefs.getString(Preferences.token),
    );
  }

  void saveToPrefs(SharedPreferences prefs) {
    if (user != null) {
      prefs.setString(Preferences.token, token!);
      prefs.setInt(Preferences.expiredAt, expiredAt!);
      user?.saveToPrefs(prefs);
    }
  }

  Map<String, dynamic> toJson() => _$UserLoginResponseDTOToJson(this);

  late User? user;
  late String? token;

  @JsonKey(name: 'expire_at')
  late int? expiredAt;
  late String? error;
}
