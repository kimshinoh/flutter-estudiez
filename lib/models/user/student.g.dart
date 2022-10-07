// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Student _$StudentFromJson(Map<String, dynamic> json) => Student(
      json['id'] as String,
      json['name'] as String,
      json['address'] as String?,
      DateTime.parse(json['birthday'] as String),
      json['parent'] == null
          ? null
          : Parent.fromJson(json['parent'] as Map<String, dynamic>),
      (json['marks'] as List<dynamic>?)
          ?.map((e) => Mark.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['subjectClass'] as List<dynamic>)
          .map((e) => SubjectClass.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$StudentToJson(Student instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address': instance.address,
      'birthday': instance.birthday.toIso8601String(),
      'parent': instance.parent,
      'marks': instance.marks,
      'subjectClass': instance.subjectClass,
    };
