import 'package:fruity/models/exam/exam.dart';
import 'package:fruity/models/resource/resource.dart';
import 'package:fruity/models/subject/subject.dart';
import 'package:fruity/models/user/student.dart';
import 'package:fruity/models/user/teacher.dart';
import 'package:json_annotation/json_annotation.dart';
part 'subjectClass.g.dart';
@JsonSerializable()
class SubjectClass {
  String id;
  String name;
  String code;
  DateTime startAt;
  DateTime endAt;
  Subject subject;
  Teacher teacher;
  List<Student> students;
  List<Resource> resources;
  List<Exam> exams;
  SubjectClass(
    this.id,
    this.name,
    this.code,
    this.startAt,
    this.endAt,
    this.subject,
    this.teacher,
    this.students,
    this.resources,
    this.exams,
  );
  factory SubjectClass.fromJson(Map<String, dynamic> json) => _$SubjectClassFromJson(json);
  Map<String, dynamic> toJson() => _$SubjectClassToJson(this);
}