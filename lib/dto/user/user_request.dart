import 'package:json_annotation/json_annotation.dart';

part 'user_request.g.dart';

@JsonSerializable()
class UserLoginRequestDTO {
  UserLoginRequestDTO({
    required this.phoneNumber,
    required this.idToken,
  });

  factory UserLoginRequestDTO.fromJson(Map<String, dynamic> json) =>
      _$UserLoginRequestDTOFromJson(json);

  Map<String, dynamic> toJson() => _$UserLoginRequestDTOToJson(this);

  String phoneNumber;
  String idToken;
}
