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
