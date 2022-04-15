import 'package:fruity/models/cart/cart.dart';
import 'package:fruity/models/time/time.dart';
import 'package:json_annotation/json_annotation.dart';

part 'order_request.g.dart';

@JsonSerializable(explicitToJson: true)
@CustomDateTimeConverter()
class CreateOrderRequest {
  CreateOrderRequest(
      {required this.sellerId,
      required this.paymentId,
      required this.orderItems,
      required this.receivedAt,
      this.userAddressId,
      this.note});

  factory CreateOrderRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateOrderRequestFromJson(json);
  Map<String, dynamic> toJson() => _$CreateOrderRequestToJson(this);

  @JsonKey(name: 'seller_id')
  String sellerId;

  @JsonKey(name: 'payment_id')
  String paymentId;

  @JsonKey(name: 'order_items')
  List<CartItem> orderItems;

  @JsonKey(name: 'received_at')
  DateTime receivedAt;

  @JsonKey(name: 'user_address_id')
  String? userAddressId;

  @JsonKey(name: 'note')
  String? note;
}
