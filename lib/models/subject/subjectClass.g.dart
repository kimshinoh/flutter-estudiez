// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subjectClass.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubjectClass _$SubjectClassFromJson(Map<String, dynamic> json) => SubjectClass(
      json['id'] as String,
      json['name'] as String,
      json['code'] as String?,
      json['startAt'] == null
          ? null
          : DateTime.parse(json['startAt'] as String),
      json['endAt'] == null ? null : DateTime.parse(json['endAt'] as String),
      json['subject'] as String?,
      json['teacher'] as String?,
      DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$SubjectClassToJson(SubjectClass instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
      'startAt': instance.startAt?.toIso8601String(),
      'endAt': instance.endAt?.toIso8601String(),
      'subject': instance.subject,
      'teacher': instance.teacher,
      'createdAt': instance.createdAt.toIso8601String(),
    };
