// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mark.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Mark _$MarkFromJson(Map<String, dynamic> json) => Mark(
      json['id'] as String,
      (json['score'] as num?)?.toDouble(),
      json['name'] as String?,
      json['exam'] as String?,
      json['student'] as String?,
      json['subjectClass'] as String?,
    );

Map<String, dynamic> _$MarkToJson(Mark instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'score': instance.score,
      'exam': instance.exam,
      'student': instance.student,
      'subjectClass': instance.subjectClass,
    };
