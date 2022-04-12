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
      oldPrice: (json['old_price'] as num?)?.toDouble(),
      instruction: json['instruction'] as String?,
      packs:
          (json['packs'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              [],
      origin: json['origin'] as String?,
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      unit: json['unit'] as String?,
      percent: (json['percent'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'old_price': instance.oldPrice,
      'category_id': instance.categoryId,
      'image_url': instance.imageUrl,
      'image_urls': instance.imageUrls,
      'unit': instance.unit,
      'tags': instance.tags,
      'instruction': instance.instruction,
      'origin': instance.origin,
      'percent': instance.percent,
      'packs': instance.packs,
    };
