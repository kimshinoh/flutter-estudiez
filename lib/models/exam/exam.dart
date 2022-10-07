import 'package:fruity/models/mark/mark.dart';
import 'package:fruity/models/subject/subjectClass.dart';
import 'package:json_annotation/json_annotation.dart';
part 'exam.g.dart';
@JsonSerializable()
class Exam {
  String id;
  String name;
  int duration;
  String type;
  SubjectClass subjectClass;
  List<Mark> marks;
  Exam(
    this.id,
    this.name,
    this.duration,
    this.type,
    this.subjectClass,
    this.marks,
  );
  factory Exam.fromJson(Map<String, dynamic> json) => _$ExamFromJson(json);
  Map<String, dynamic> toJson() => _$ExamToJson(this);
}