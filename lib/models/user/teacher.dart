import 'package:fruity/models/subject/subjectClass.dart';
import 'package:json_annotation/json_annotation.dart';
part 'teacher.g.dart';
@JsonSerializable()
class Teacher {
  String id;
  String? name;
  String? address;
  String? phone;
  String? avatar;
  // List<SubjectClass>? subjectClass;
  Teacher(
    this.id,
    this.name,
    this.address,
    this.phone,
    this.avatar,
  );
  factory Teacher.fromJson(Map<String, dynamic> json) => _$TeacherFromJson(json);
  Map<String, dynamic> toJson() => _$TeacherToJson(this);
}