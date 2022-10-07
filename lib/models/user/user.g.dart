// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      json['id'] as String,
      json['name'] as String,
      json['address'] as String?,
      json['type'] as String,
      json['student'] == null
          ? null
          : Student.fromJson(json['student'] as Map<String, dynamic>),
      json['teacher'] == null
          ? null
          : Teacher.fromJson(json['teacher'] as Map<String, dynamic>),
      json['parents'] == null
          ? null
          : Parent.fromJson(json['parents'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address': instance.address,
      'type': instance.type,
      'student': instance.student,
      'teacher': instance.teacher,
      'parents': instance.parents,
    };
