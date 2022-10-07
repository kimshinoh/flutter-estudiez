import 'dart:ffi';

import 'package:fruity/models/exam/exam.dart';
import 'package:fruity/models/user/student.dart';
import 'package:json_annotation/json_annotation.dart';
part 'mark.g.dart';
@JsonSerializable()
class Mark {
  String id;
  String name;
  double? score;
  Exam? exam;
  int? duration;
  Student? student;
  String? subjectClass;
  Mark(
    this.id,
    this.score,
    this.name,
    this.duration,
    this.exam,
    this.student,
    this.subjectClass,
  );
  factory Mark.fromJson(Map<String, dynamic> json) => _$MarkFromJson(json);
  Map<String, dynamic> toJson() => _$MarkToJson(this);
   
}