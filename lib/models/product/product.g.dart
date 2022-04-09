// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      id: json['id'] as String,
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
      description: json['description'] as String,
      imageUrl: json['image_url'] as String,
      categoryId: json['category_id'] as String,
      imageUrls: (json['image_urls'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      sellerId: json['seller_id'] as String,
      oldPrice: (json['old_price'] as num?)?.toDouble(),
      instruction: json['instruction'] as String?,
      packs:
          (json['packs'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              [],
      origin: json['origin'] as String?,
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      unit: json['unit'] as String?,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'old_price': instance.oldPrice,
      'category_id': instance.categoryId,
      'seller_id': instance.sellerId,
      'image_url': instance.imageUrl,
      'image_urls': instance.imageUrls,
      'unit': instance.unit,
      'tags': instance.tags,
      'instruction': instance.instruction,
      'origin': instance.origin,
      'packs': instance.packs,
    };
