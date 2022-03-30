import 'package:fruity/models/user/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_response.g.dart';

@JsonSerializable(explicitToJson: true)
class UserLoginResponseDTO {
  UserLoginResponseDTO({this.user, this.token, this.expiredAt, this.error});

  factory UserLoginResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$UserLoginResponseDTOFromJson(json);

  factory UserLoginResponseDTO.withError(String error) =>
      UserLoginResponseDTO(error: error);

  Map<String, dynamic> toJson() => _$UserLoginResponseDTOToJson(this);

  late User? user;
  late String? token;

  @JsonKey(name: 'expire_at')
  late int? expiredAt;
  late String? error;
}
