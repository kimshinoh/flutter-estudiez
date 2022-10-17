import 'dart:ffi';

import 'package:fruity/models/exam/exam.dart';
import 'package:fruity/models/mark/mark.dart';
import 'package:fruity/models/user/student.dart';
import 'package:json_annotation/json_annotation.dart';
part 'cook_mark.g.dart';
@JsonSerializable()
class CookMark {
  String? subject;
  String? subjectId;
  List<Mark> marks;
  CookMark(
    this.subject,
    this.subjectId,
    this.marks,
  );
  factory CookMark.fromJson(Map<String, dynamic> json) => _$CookMarkFromJson(json);
  Map<String, dynamic> toJson() => _$CookMarkToJson(this);
   
}