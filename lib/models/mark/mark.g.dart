// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mark.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Mark _$MarkFromJson(Map<String, dynamic> json) => Mark(
      json['id'] as String,
      (json['score'] as num).toDouble(),
      Exam.fromJson(json['exam'] as Map<String, dynamic>),
      Student.fromJson(json['student'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MarkToJson(Mark instance) => <String, dynamic>{
      'id': instance.id,
      'score': instance.score,
      'exam': instance.exam,
      'student': instance.student,
    };
