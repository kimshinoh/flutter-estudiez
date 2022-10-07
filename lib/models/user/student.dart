import 'package:fruity/models/mark/mark.dart';
import 'package:fruity/models/subject/subjectClass.dart';
import 'package:fruity/models/user/parent.dart';
import 'package:json_annotation/json_annotation.dart';
part 'student.g.dart';
@JsonSerializable()
class Student {
  String id;
  String name;
  String? address;
  DateTime birthday;
  Parent? parent;
  List<Mark>? marks;
  List<SubjectClass> subjectClass;
  Student(
    this.id,
    this.name,
    this.address,
    this.birthday,
    this.parent,
    this.marks,
    this.subjectClass,
  );  
  factory Student.fromJson(Map<String, dynamic> json) => _$StudentFromJson(json);
  Map<String, dynamic> toJson() => _$StudentToJson(this);
}