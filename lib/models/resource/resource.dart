import 'package:fruity/models/subject/subjectClass.dart';
import 'package:json_annotation/json_annotation.dart';

part 'resource.g.dart';
@JsonSerializable()
class Resource {
  String id;
  String name;
  String type;
  SubjectClass subjectClass;
  Resource(
    this.id,
    this.name,
    this.type,
    this.subjectClass,
  );
  factory Resource.fromJson(Map<String, dynamic> json) => _$ResourceFromJson(json);
  Map<String, dynamic> toJson() => _$ResourceToJson(this);
}