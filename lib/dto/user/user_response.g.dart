// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserLoginResponseDTO _$UserLoginResponseDTOFromJson(
        Map<String, dynamic> json) =>
    UserLoginResponseDTO(
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      token: json['token'] as String?,
      expiredAt: json['expire_at'] as int?,
      error: json['error'] as String?,
    );

Map<String, dynamic> _$UserLoginResponseDTOToJson(
        UserLoginResponseDTO instance) =>
    <String, dynamic>{
      'user': instance.user?.toJson(),
      'token': instance.token,
      'expire_at': instance.expiredAt,
      'error': instance.error,
    };

UpdateProfileResponse _$UpdateProfileResponseFromJson(
        Map<String, dynamic> json) =>
    UpdateProfileResponse(
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      errorMessage: json['errorMessage'] as String?,
    );

Map<String, dynamic> _$UpdateProfileResponseToJson(
        UpdateProfileResponse instance) =>
    <String, dynamic>{
      'user': instance.user?.toJson(),
      'errorMessage': instance.errorMessage,
    };
