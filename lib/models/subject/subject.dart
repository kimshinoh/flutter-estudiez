import 'package:fruity/models/subject/subjectClass.dart';
import 'package:json_annotation/json_annotation.dart';
part 'subject.g.dart';
@JsonSerializable()
class Subject {
  String id;
  String name;
  List<SubjectClass> subjectClass;
  Subject(
    this.id,
    this.name,
    this.subjectClass,
  );
  factory Subject.fromJson(Map<String, dynamic> json) => _$SubjectFromJson(json);
  Map<String, dynamic> toJson() => _$SubjectToJson(this);
}