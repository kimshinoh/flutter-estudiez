// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryListResponse _$CategoryListResponseFromJson(
        Map<String, dynamic> json) =>
    CategoryListResponse(
      errorMessage: json['errorMessage'] as String?,
      categories: (json['categories'] as List<dynamic>)
          .map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CategoryListResponseToJson(
        CategoryListResponse instance) =>
    <String, dynamic>{
      'categories': instance.categories,
      'errorMessage': instance.errorMessage,
    };

ListProductsByCategoryResponse _$ListProductsByCategoryResponseFromJson(
        Map<String, dynamic> json) =>
    ListProductsByCategoryResponse(
      errorMessage: json['message'] as String?,
      products: (json['products'] as List<dynamic>)
          .map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListProductsByCategoryResponseToJson(
        ListProductsByCategoryResponse instance) =>
    <String, dynamic>{
      'products': instance.products.map((e) => e.toJson()).toList(),
      'message': instance.errorMessage,
    };
