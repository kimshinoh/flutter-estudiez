// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListProductsResponseDTO _$ListProductsResponseDTOFromJson(
        Map<String, dynamic> json) =>
    ListProductsResponseDTO(
      errorMessage: json['message'] as String?,
      products: (json['products'] as List<dynamic>)
          .map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListProductsResponseDTOToJson(
        ListProductsResponseDTO instance) =>
    <String, dynamic>{
      'products': instance.products,
      'message': instance.errorMessage,
    };

SaleOffProductResponseDTO _$SaleOffProductResponseDTOFromJson(
        Map<String, dynamic> json) =>
    SaleOffProductResponseDTO(
      errorMessage: json['message'] as String?,
      products: (json['products'] as List<dynamic>)
          .map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SaleOffProductResponseDTOToJson(
        SaleOffProductResponseDTO instance) =>
    <String, dynamic>{
      'products': instance.products,
      'message': instance.errorMessage,
    };

SaleShockReponseDTO _$SaleShockReponseDTOFromJson(Map<String, dynamic> json) =>
    SaleShockReponseDTO(
      errorMessage: json['message'] as String?,
      products: (json['products'] as List<dynamic>)
          .map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SaleShockReponseDTOToJson(
        SaleShockReponseDTO instance) =>
    <String, dynamic>{
      'products': instance.products,
      'message': instance.errorMessage,
    };
