// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateOrderResponse _$CreateOrderResponseFromJson(Map<String, dynamic> json) =>
    CreateOrderResponse(
      order: json['order'] == null
          ? null
          : Order.fromJson(json['order'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CreateOrderResponseToJson(
        CreateOrderResponse instance) =>
    <String, dynamic>{
      'order': instance.order,
    };

MyOrdersResponse _$MyOrdersResponseFromJson(Map<String, dynamic> json) =>
    MyOrdersResponse(
      orders: (json['orders'] as List<dynamic>)
          .map((e) => Order.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MyOrdersResponseToJson(MyOrdersResponse instance) =>
    <String, dynamic>{
      'orders': instance.orders,
    };

GetOrderByIdResponse _$GetOrderByIdResponseFromJson(
        Map<String, dynamic> json) =>
    GetOrderByIdResponse(
      order: json['order'] == null
          ? null
          : Order.fromJson(json['order'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetOrderByIdResponseToJson(
        GetOrderByIdResponse instance) =>
    <String, dynamic>{
      'order': instance.order?.toJson(),
    };
