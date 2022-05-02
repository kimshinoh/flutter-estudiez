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

SearchProductResponseDTO _$SearchProductResponseDTOFromJson(
        Map<String, dynamic> json) =>
    SearchProductResponseDTO(
      errorMessage: json['message'] as String?,
      productSearch:
          ProductSearch.fromJson(json['productSearch'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SearchProductResponseDTOToJson(
        SearchProductResponseDTO instance) =>
    <String, dynamic>{
      'productSearch': instance.productSearch,
      'message': instance.errorMessage,
    };

ProductsByIdsResponseDTO _$ProductsByIdsResponseDTOFromJson(
        Map<String, dynamic> json) =>
    ProductsByIdsResponseDTO(
      errorMessage: json['message'] as String?,
      products: (json['products'] as List<dynamic>)
          .map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductsByIdsResponseDTOToJson(
        ProductsByIdsResponseDTO instance) =>
    <String, dynamic>{
      'products': instance.products,
      'message': instance.errorMessage,
    };

GetProductByIdResponse _$GetProductByIdResponseFromJson(
        Map<String, dynamic> json) =>
    GetProductByIdResponse(
      errorMessage: json['message'] as String?,
      product: json['product'] == null
          ? null
          : Product.fromJson(json['product'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetProductByIdResponseToJson(
        GetProductByIdResponse instance) =>
    <String, dynamic>{
      'product': instance.product?.toJson(),
      'message': instance.errorMessage,
    };
