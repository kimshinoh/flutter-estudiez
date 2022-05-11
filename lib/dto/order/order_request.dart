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
      required this.shippingDistance,
      required this.shippingFee,
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

  @JsonKey(name: 'shipping_fee', defaultValue: 0)
  double shippingFee;

  @JsonKey(name: 'shipping_distance', defaultValue: 0)
  double shippingDistance;

  @JsonKey(name: 'note')
  String? note;
}

@JsonSerializable()
class MyOrdersRequest {
  MyOrdersRequest({
    required this.status,
  });

  factory MyOrdersRequest.fromJson(Map<String, dynamic> json) =>
      _$MyOrdersRequestFromJson(json);
  Map<String, dynamic> toJson() => _$MyOrdersRequestToJson(this);

  @JsonKey(name: 'status')
  String status;
}

@JsonSerializable()
class GetOrderByIdRequest {
  GetOrderByIdRequest({
    required this.orderId,
  });

  factory GetOrderByIdRequest.fromJson(Map<String, dynamic> json) =>
      _$GetOrderByIdRequestFromJson(json);
  Map<String, dynamic> toJson() => _$GetOrderByIdRequestToJson(this);

  @JsonKey(name: 'order_id')
  String orderId;
}

@JsonSerializable()
class CancelOrderRequest {
  CancelOrderRequest({required this.orderId, required this.note});

  factory CancelOrderRequest.fromJson(Map<String, dynamic> json) =>
      _$CancelOrderRequestFromJson(json);
  Map<String, dynamic> toJson() => _$CancelOrderRequestToJson(this);

  @JsonKey(name: 'order_id')
  String orderId;
  String note;
  String status = 'cancelled';
}
