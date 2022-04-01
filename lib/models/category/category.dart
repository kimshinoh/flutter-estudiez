import 'package:json_annotation/json_annotation.dart';

part 'category.g.dart';

@JsonSerializable()
class Category {
  Category(
      {required this.id,
      required this.name,
      required this.imageUrl,
      this.parentId});

  String id;
  String name;
  String imageUrl;
  String? parentId;

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}
