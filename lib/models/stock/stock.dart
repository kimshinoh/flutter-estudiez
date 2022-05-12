import 'package:json_annotation/json_annotation.dart';

part 'stock.g.dart';

@JsonSerializable()
class Stock {
  Stock({
    required this.id,
    required this.productId,
    required this.quantity,
  });

  factory Stock.fromJson(Map<String, dynamic> json) => _$StockFromJson(json);
  Map<String, dynamic> toJson() => _$StockToJson(this);

  @JsonKey(name: 'id')
  String id;

  @JsonKey(name: 'product_id')
  String productId;

  @JsonKey(name: 'quantity')
  int quantity;
}
