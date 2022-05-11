// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Order _$OrderFromJson(Map<String, dynamic> json) => Order(
      id: json['id'] as String,
      textId: json['text_id'] as String,
      seller: Seller.fromJson(json['seller'] as Map<String, dynamic>),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      status: json['status'] as String,
      payment: Payment.fromJson(json['payment'] as Map<String, dynamic>),
      orderItems: (json['order_items'] as List<dynamic>)
          .map((e) => OrderItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      paymentId: json['payment_id'] as String,
      receivedAt: DateTime.parse(json['received_at'] as String),
      sellerId: json['seller_id'] as String,
      tracks: (json['tracks'] as List<dynamic>)
          .map((e) => Track.fromJson(e as Map<String, dynamic>))
          .toList(),
      userAddress:
          UserAddress.fromJson(json['user_address'] as Map<String, dynamic>),
      userAddressId: json['user_address_id'] as String,
      userId: json['user_id'] as String,
      note: json['note'] as String?,
      totalPrice: (json['total_price'] as num?)?.toDouble(),
    )
      ..shippingFee = (json['shipping_fee'] as num?)?.toDouble() ?? 0
      ..shippingDistance = (json['shipping_distance'] as num?)?.toDouble() ?? 0;

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      'id': instance.id,
      'text_id': instance.textId,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'user_id': instance.userId,
      'status': instance.status,
      'seller_id': instance.sellerId,
      'seller': instance.seller.toJson(),
      'order_items': instance.orderItems.map((e) => e.toJson()).toList(),
      'payment_id': instance.paymentId,
      'payment': instance.payment.toJson(),
      'tracks': instance.tracks.map((e) => e.toJson()).toList(),
      'received_at': instance.receivedAt.toIso8601String(),
      'user_address_id': instance.userAddressId,
      'user_address': instance.userAddress.toJson(),
      'note': instance.note,
      'total_price': instance.totalPrice,
      'shipping_fee': instance.shippingFee,
      'shipping_distance': instance.shippingDistance,
    };

OrderItem _$OrderItemFromJson(Map<String, dynamic> json) => OrderItem(
      id: json['id'] as String,
      product: Product.fromJson(json['product'] as Map<String, dynamic>),
      quantity: json['quantity'] as int,
      price: (json['price'] as num).toDouble(),
      productId: json['product_id'] as String,
      note: json['note'] as String?,
    );

Map<String, dynamic> _$OrderItemToJson(OrderItem instance) => <String, dynamic>{
      'id': instance.id,
      'product_id': instance.productId,
      'product': instance.product.toJson(),
      'quantity': instance.quantity,
      'price': instance.price,
      'note': instance.note,
    };

Track _$TrackFromJson(Map<String, dynamic> json) => Track(
      id: json['id'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      status: json['status'] as String,
      orderId: json['order_id'] as String,
      time: DateTime.parse(json['time'] as String),
      note: json['note'] as String?,
    );

Map<String, dynamic> _$TrackToJson(Track instance) => <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt.toIso8601String(),
      'order_id': instance.orderId,
      'status': instance.status,
      'time': instance.time.toIso8601String(),
      'note': instance.note,
    };
