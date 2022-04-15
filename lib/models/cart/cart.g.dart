// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Cart _$CartFromJson(Map<String, dynamic> json) => Cart()
  ..items = (json['items'] as List<dynamic>)
      .map((e) => CartItem.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$CartToJson(Cart instance) => <String, dynamic>{
      'items': instance.items.map((e) => e.toJson()).toList(),
    };

CartItem _$CartItemFromJson(Map<String, dynamic> json) => CartItem(
      id: json['id'] as String,
      productId: json['product_id'] as String,
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
      quantity: json['quantity'] as int,
      imageUrl: json['image_url'] as String,
      sellerId: json['seller_id'] as String,
      unit: json['unit'] as String?,
    );

Map<String, dynamic> _$CartItemToJson(CartItem instance) => <String, dynamic>{
      'id': instance.id,
      'product_id': instance.productId,
      'name': instance.name,
      'price': instance.price,
      'image_url': instance.imageUrl,
      'quantity': instance.quantity,
      'unit': instance.unit,
      'seller_id': instance.sellerId,
    };
