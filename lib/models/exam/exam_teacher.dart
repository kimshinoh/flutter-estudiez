import 'package:fruity/models/mark/mark.dart';
import 'package:fruity/models/subject/subjectClass.dart';
import 'package:json_annotation/json_annotation.dart';
part 'exam_teacher.g.dart';

@JsonSerializable()
class ExamTeacher {
  String? exam;
  String? examId;
  double? score;
  String? markId;
  ExamTeacher(
    this.exam,
    this.examId,
    this.score,
    this.markId,
  );
  factory ExamTeacher.fromJson(Map<String, dynamic> json) =>
      _$ExamTeacherFromJson(json);
  Map<String, dynamic> toJson() => _$ExamTeacherToJson(this);
}
