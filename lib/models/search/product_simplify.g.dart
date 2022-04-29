// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_simplify.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductSimplify _$ProductSimplifyFromJson(Map<String, dynamic> json) =>
    ProductSimplify(
      id: json['id'] as String,
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
      imageUrl: json['imageUrl'] as String?,
      oldPrice: (json['oldPrice'] as num?)?.toDouble(),
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      unit: json['unit'] as String?,
    );

Map<String, dynamic> _$ProductSimplifyToJson(ProductSimplify instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'oldPrice': instance.oldPrice,
      'imageUrl': instance.imageUrl,
      'unit': instance.unit,
      'tags': instance.tags,
    };
