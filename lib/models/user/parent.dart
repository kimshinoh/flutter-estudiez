import 'package:fruity/models/user/student.dart';
import 'package:json_annotation/json_annotation.dart';
part 'parent.g.dart';
@JsonSerializable()
class Parent {
  String id;
  String name;
  String? address;
  List<Student>? students;
  Parent(
    this.id,
    this.name,
    this.address,
    this.students,
  );
  factory Parent.fromJson(Map<String, dynamic> json) => _$ParentFromJson(json);
  Map<String, dynamic> toJson() => _$ParentToJson(this);
}
