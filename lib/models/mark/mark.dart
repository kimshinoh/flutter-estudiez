import 'dart:ffi';

import 'package:fruity/models/exam/exam.dart';
import 'package:fruity/models/user/student.dart';
import 'package:json_annotation/json_annotation.dart';
part 'mark.g.dart';
@JsonSerializable()
class Mark {
  String id;
  double score;
  Exam exam;
  Student student;
  Mark(
    this.id,
    this.score,
    this.exam,
    this.student,
  );
  factory Mark.fromJson(Map<String, dynamic> json) => _$MarkFromJson(json);
  Map<String, dynamic> toJson() => _$MarkToJson(this);
   
}