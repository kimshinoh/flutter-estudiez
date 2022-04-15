import 'package:fruity/models/order/order.dart';
import 'package:json_annotation/json_annotation.dart';

part 'order_response.g.dart';

@JsonSerializable()
class CreateOrderResponse {
  CreateOrderResponse({
    Order? order,
    String? message,
  }) {
    this._order = order;
    this._errorMessage = message;
  }

  factory CreateOrderResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateOrderResponseFromJson(json);
  Map<String, dynamic> toJson() => _$CreateOrderResponseToJson(this);

  factory CreateOrderResponse.withError(String message) =>
      CreateOrderResponse(order: null, message: message);

  Order? _order;
  Order? get order => _order;

  String? _errorMessage = null;

  @JsonKey(name: 'message')
  String? get errorMessage => _errorMessage;
}
