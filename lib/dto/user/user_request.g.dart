// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserLoginRequestDTO _$UserLoginRequestDTOFromJson(Map<String, dynamic> json) =>
    UserLoginRequestDTO(
      phoneNumber: json['phoneNumber'] as String,
      idToken: json['idToken'] as String,
    );

Map<String, dynamic> _$UserLoginRequestDTOToJson(
        UserLoginRequestDTO instance) =>
    <String, dynamic>{
      'phoneNumber': instance.phoneNumber,
      'idToken': instance.idToken,
    };

UpdateFCMTokenRequest _$UpdateFCMTokenRequestFromJson(
        Map<String, dynamic> json) =>
    UpdateFCMTokenRequest(
      token: json['token'] as String,
    );

Map<String, dynamic> _$UpdateFCMTokenRequestToJson(
        UpdateFCMTokenRequest instance) =>
    <String, dynamic>{
      'token': instance.token,
    };

UpdateProfileRequest _$UpdateProfileRequestFromJson(
        Map<String, dynamic> json) =>
    UpdateProfileRequest(
      fullName: json['full_name'] as String,
      email: json['email'] as String,
      avatar: json['avatar'] as String,
    );

Map<String, dynamic> _$UpdateProfileRequestToJson(
        UpdateProfileRequest instance) =>
    <String, dynamic>{
      'full_name': instance.fullName,
      'avatar': instance.avatar,
      'email': instance.email,
    };
