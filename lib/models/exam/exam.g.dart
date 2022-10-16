// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exam.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Exam _$ExamFromJson(Map<String, dynamic> json) => Exam(
      json['id'] as String,
      json['name'] as String?,
      json['duration'] as int?,
      json['type'] as String?,
      json['subjectClass'] as String?,
      (json['marks'] as List<dynamic>?)
          ?.map((e) => Mark.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$ExamToJson(Exam instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'duration': instance.duration,
      'type': instance.type,
      'createdAt': instance.createdAt?.toIso8601String(),
      'subjectClass': instance.subjectClass,
      'marks': instance.marks,
    };
