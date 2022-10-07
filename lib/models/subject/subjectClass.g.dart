// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subjectClass.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubjectClass _$SubjectClassFromJson(Map<String, dynamic> json) => SubjectClass(
      json['id'] as String,
      json['name'] as String,
      json['code'] as String,
      DateTime.parse(json['startAt'] as String),
      DateTime.parse(json['endAt'] as String),
      Subject.fromJson(json['subject'] as Map<String, dynamic>),
      Teacher.fromJson(json['teacher'] as Map<String, dynamic>),
      (json['students'] as List<dynamic>)
          .map((e) => Student.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['resources'] as List<dynamic>)
          .map((e) => Resource.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['exams'] as List<dynamic>)
          .map((e) => Exam.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SubjectClassToJson(SubjectClass instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
      'startAt': instance.startAt.toIso8601String(),
      'endAt': instance.endAt.toIso8601String(),
      'subject': instance.subject,
      'teacher': instance.teacher,
      'students': instance.students,
      'resources': instance.resources,
      'exams': instance.exams,
    };
