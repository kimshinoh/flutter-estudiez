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
      json['subject'] as String?,
      json['subjectId'] as String?,
      json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$MarkToJson(Mark instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'score': instance.score,
      'exam': instance.exam,
      'student': instance.student,
      'subject': instance.subject,
      'subjectId': instance.subjectId,
      'createdAt': instance.createdAt?.toIso8601String(),
    };
