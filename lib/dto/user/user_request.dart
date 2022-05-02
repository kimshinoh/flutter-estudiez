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

@JsonSerializable()
class UpdateFCMTokenRequest {
  UpdateFCMTokenRequest({required this.token});

  factory UpdateFCMTokenRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateFCMTokenRequestFromJson(json);
  Map<String, dynamic> toJson() => _$UpdateFCMTokenRequestToJson(this);

  String token;
}

@JsonSerializable()
class UpdateProfileRequest {
  UpdateProfileRequest(
      {required this.fullName, required this.email, required this.avatar});

  factory UpdateProfileRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateProfileRequestFromJson(json);
  Map<String, dynamic> toJson() => _$UpdateProfileRequestToJson(this);

  @JsonKey(name: 'full_name')
  String fullName;
  String avatar;
  String email;
}
