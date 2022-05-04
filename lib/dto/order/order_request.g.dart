// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateOrderRequest _$CreateOrderRequestFromJson(Map<String, dynamic> json) =>
    CreateOrderRequest(
      sellerId: json['seller_id'] as String,
      paymentId: json['payment_id'] as String,
      orderItems: (json['order_items'] as List<dynamic>)
          .map((e) => CartItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      receivedAt: const CustomDateTimeConverter()
          .fromJson(json['received_at'] as String),
      shippingDistance: (json['shipping_distance'] as num?)?.toDouble() ?? 0,
      shippingFee: (json['shipping_fee'] as num?)?.toDouble() ?? 0,
      userAddressId: json['user_address_id'] as String?,
      note: json['note'] as String?,
    );

Map<String, dynamic> _$CreateOrderRequestToJson(CreateOrderRequest instance) =>
    <String, dynamic>{
      'seller_id': instance.sellerId,
      'payment_id': instance.paymentId,
      'order_items': instance.orderItems.map((e) => e.toJson()).toList(),
      'received_at':
          const CustomDateTimeConverter().toJson(instance.receivedAt),
      'user_address_id': instance.userAddressId,
      'shipping_fee': instance.shippingFee,
      'shipping_distance': instance.shippingDistance,
      'note': instance.note,
    };

MyOrdersRequest _$MyOrdersRequestFromJson(Map<String, dynamic> json) =>
    MyOrdersRequest(
      status: json['status'] as String,
    );

Map<String, dynamic> _$MyOrdersRequestToJson(MyOrdersRequest instance) =>
    <String, dynamic>{
      'status': instance.status,
    };

GetOrderByIdRequest _$GetOrderByIdRequestFromJson(Map<String, dynamic> json) =>
    GetOrderByIdRequest(
      orderId: json['order_id'] as String,
    );

Map<String, dynamic> _$GetOrderByIdRequestToJson(
        GetOrderByIdRequest instance) =>
    <String, dynamic>{
      'order_id': instance.orderId,
    };
