import 'dart:ffi';

import 'package:fruity/models/exam/exam.dart';
import 'package:fruity/models/exam/exam_teacher.dart';
import 'package:fruity/models/user/student.dart';
import 'package:json_annotation/json_annotation.dart';
part 'teacher_mark.g.dart';

@JsonSerializable()
class TeacherMark {
  String? student;
  String? studentId;
  String? subject;
  List<ExamTeacher> exams;

  TeacherMark(
    this.student,
    this.studentId,
    this.subject,
    this.exams,
  );
  factory TeacherMark.fromJson(Map<String, dynamic> json) =>
      _$TeacherMarkFromJson(json);
  Map<String, dynamic> toJson() => _$TeacherMarkToJson(this);
}
