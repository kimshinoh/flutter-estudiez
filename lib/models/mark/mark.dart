import 'dart:ffi';

import 'package:fruity/models/exam/exam.dart';
import 'package:fruity/models/user/student.dart';
import 'package:json_annotation/json_annotation.dart';
part 'mark.g.dart';
@JsonSerializable()
class Mark {
  String id;
  String? name;
  double? score;
  String? exam;
  String? student;
  String? subject;
  String? subjectId;
  DateTime? createdAt;
  Mark(
    this.id,
    this.score,
    this.name,
    this.exam,
    this.student,
    this.subject,
    this.subjectId,
    this.createdAt,
  );
  factory Mark.fromJson(Map<String, dynamic> json) => _$MarkFromJson(json);
  Map<String, dynamic> toJson() => _$MarkToJson(this);
   
}