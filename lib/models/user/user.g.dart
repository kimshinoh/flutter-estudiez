// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as String,
      fullName: json['full_name'] as String,
      phoneNumber: json['phone_number'] as String,
      email: json['email'] as String?,
      avatar: json['avatar'] as String? ?? 'https://i.imgur.com/EYdQnGt.jpeg',
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'full_name': instance.fullName,
      'phone_number': instance.phoneNumber,
      'email': instance.email,
      'avatar': instance.avatar,
    };
