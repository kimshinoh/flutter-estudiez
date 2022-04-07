import 'package:fruity/models/cart/cart.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class Product {
  Product(
      {required this.id,
      required this.name,
      required this.price,
      required this.description,
      required this.imageUrl,
      required this.categoryId,
      required this.imageUrls,
      this.oldPrice,
      this.instruction,
      required this.packs,
      this.origin,
      required this.tags,
      this.unit});
  String id;
  String name;
  String description;
  double price;

  @JsonKey(name: 'old_price')
  double? oldPrice;
  @JsonKey(name: 'category_id')
  String categoryId;

  @JsonKey(name: 'image_url')
  String imageUrl;

  @JsonKey(name: 'image_urls')
  List<String> imageUrls;

  String? unit;
  List<String> tags;
  String? instruction;
  String? origin;

  @JsonKey(name: 'packs', defaultValue: [])
  List<String> packs;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);

  CartItem toCartItem({int quantity = 1}) {
    return CartItem(
      id: id,
      productId: id,
      name: name,
      price: price,
      unit: unit,
      imageUrl: imageUrl,
      quantity: quantity,
    );
  }
}
