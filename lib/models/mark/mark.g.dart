// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mark.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Mark _$MarkFromJson(Map<String, dynamic> json) => Mark(
      json['id'] as String,
      (json['score'] as num?)?.toDouble(),
      json['name'] as String,
      json['duration'] as int?,
      json['exam'] == null
          ? null
          : Exam.fromJson(json['exam'] as Map<String, dynamic>),
      json['student'] == null
          ? null
          : Student.fromJson(json['student'] as Map<String, dynamic>),
      json['subjectClass'] as String?,
    );

Map<String, dynamic> _$MarkToJson(Mark instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'score': instance.score,
      'exam': instance.exam,
      'duration': instance.duration,
      'student': instance.student,
      'subjectClass': instance.subjectClass,
    };
