import 'dart:convert';

import 'dart:core';

import 'package:fruity/models/user/parent.dart';
import 'package:fruity/models/user/student.dart';
import 'package:fruity/models/user/teacher.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';
@JsonSerializable()
class User {
  String id;
  String name;
  String? address;
  String type;
  Student? student;
  Teacher? teacher;
  Parent? parents;
  User(
    this.id,
    this.name,
    this.address,
    this.type,
    this.student,
    this.teacher,
    this.parents,
  );
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
