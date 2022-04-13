import 'package:json_annotation/json_annotation.dart';

part 'cart.g.dart';

@JsonSerializable(explicitToJson: true)
class Cart {
  Cart();

  List<CartItem> items = [];

  factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);
  Map<String, dynamic> toJson() => _$CartToJson(this);
}

@JsonSerializable()
class CartItem {
  CartItem({
    required this.id,
    required this.productId,
    required this.name,
    required this.price,
    required this.quantity,
    required this.imageUrl,
    required this.sellerId,
    this.unit,
  });

  String id;
  String productId;
  String name;
  double price;
  String imageUrl;
  int quantity;
  String? unit;
  String sellerId;

  @JsonKey(ignore: true)
  bool isSelected = true;

  factory CartItem.fromJson(Map<String, dynamic> json) =>
      _$CartItemFromJson(json);
  Map<String, dynamic> toJson() => _$CartItemToJson(this);
}
