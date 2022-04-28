import 'package:fruity/models/order/order.dart';
import 'package:json_annotation/json_annotation.dart';

part 'order_response.g.dart';

@JsonSerializable()
class CreateOrderResponse {
  CreateOrderResponse({
    Order? order,
    String? message,
  }) {
    _order = order;
    _errorMessage = message;
  }

  factory CreateOrderResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateOrderResponseFromJson(json);
  Map<String, dynamic> toJson() => _$CreateOrderResponseToJson(this);

  factory CreateOrderResponse.withError(String message) =>
      CreateOrderResponse(message: message);

  Order? _order;
  Order? get order => _order;

  String? _errorMessage;

  @JsonKey(name: 'message')
  String? get errorMessage => _errorMessage;
}

@JsonSerializable()
class MyOrdersResponse {
  MyOrdersResponse({
    required List<Order> orders,
    String? message,
  }) {
    _orders = orders;
    _errorMessage = message;
  }

  factory MyOrdersResponse.fromJson(Map<String, dynamic> json) =>
      _$MyOrdersResponseFromJson(json);

  factory MyOrdersResponse.withError(String message) =>
      MyOrdersResponse(message: message, orders: []);

  Map<String, dynamic> toJson() => _$MyOrdersResponseToJson(this);

  List<Order> _orders = [];
  List<Order> get orders => _orders;

  String? _errorMessage;

  @JsonKey(name: 'message')
  String? get errorMessage => _errorMessage;
}

@JsonSerializable()
class GetOrderByIdResponse {
  GetOrderByIdResponse({
    Order? order,
    String? message,
  }) {
    _order = order;
    _errorMessage = message;
  }

  factory GetOrderByIdResponse.fromJson(Map<String, dynamic> json) =>
      _$GetOrderByIdResponseFromJson(json);

  factory GetOrderByIdResponse.withError(String message) =>
      GetOrderByIdResponse(
        message: message,
      );

  Map<String, dynamic> toJson() => _$GetOrderByIdResponseToJson(this);

  Order? _order;
  Order? get order => _order;

  String? _errorMessage;

  @JsonKey(name: 'message')
  String? get errorMessage => _errorMessage;
}
