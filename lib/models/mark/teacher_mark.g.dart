// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'teacher_mark.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TeacherMark _$TeacherMarkFromJson(Map<String, dynamic> json) => TeacherMark(
      json['student'] as String?,
      json['studentId'] as String?,
      json['subject'] as String?,
      (json['exams'] as List<dynamic>)
          .map((e) => ExamTeacher.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TeacherMarkToJson(TeacherMark instance) =>
    <String, dynamic>{
      'student': instance.student,
      'studentId': instance.studentId,
      'subject': instance.subject,
      'exams': instance.exams,
    };
