// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exam_teacher.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExamTeacher _$ExamTeacherFromJson(Map<String, dynamic> json) => ExamTeacher(
      json['exam'] as String?,
      json['examId'] as String?,
      (json['score'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ExamTeacherToJson(ExamTeacher instance) =>
    <String, dynamic>{
      'exam': instance.exam,
      'examId': instance.examId,
      'score': instance.score,
    };
