import 'package:json_annotation/json_annotation.dart';

part 'product_simplify.g.dart';

@JsonSerializable()
class ProductSimplify {
  ProductSimplify({
    required this.id,
    required this.name,
    required this.price,
    this.imageUrl,
    this.oldPrice,
    required this.tags,
    this.unit,
  });
  String id;
  String name;
  double price;

  double? oldPrice;
  String? imageUrl;

  String? unit;
  List<String> tags;

  factory ProductSimplify.fromJson(Map<String, dynamic> json) =>
      _$ProductSimplifyFromJson(json);

  Map<String, dynamic> toJson() => _$ProductSimplifyToJson(this);
}
