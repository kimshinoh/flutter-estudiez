// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListProductRequestDTO _$ListProductRequestDTOFromJson(
        Map<String, dynamic> json) =>
    ListProductRequestDTO(
      limit: json['limit'] as int,
    );

Map<String, dynamic> _$ListProductRequestDTOToJson(
        ListProductRequestDTO instance) =>
    <String, dynamic>{
      'limit': instance.limit,
    };

SaleOffProductRequestDTO _$SaleOffProductRequestDTOFromJson(
        Map<String, dynamic> json) =>
    SaleOffProductRequestDTO(
      limit: json['limit'] as int,
    );

Map<String, dynamic> _$SaleOffProductRequestDTOToJson(
        SaleOffProductRequestDTO instance) =>
    <String, dynamic>{
      'limit': instance.limit,
    };

SaleShockRequestDTO _$SaleShockRequestDTOFromJson(Map<String, dynamic> json) =>
    SaleShockRequestDTO(
      limit: json['limit'] as int,
    );

Map<String, dynamic> _$SaleShockRequestDTOToJson(
        SaleShockRequestDTO instance) =>
    <String, dynamic>{
      'limit': instance.limit,
    };

SearchProductRequestDTO _$SearchProductRequestDTOFromJson(
        Map<String, dynamic> json) =>
    SearchProductRequestDTO(
      limit: json['limit'] as int?,
      keyword: json['keyword'] as String,
    );

Map<String, dynamic> _$SearchProductRequestDTOToJson(
        SearchProductRequestDTO instance) =>
    <String, dynamic>{
      'limit': instance.limit,
      'keyword': instance.keyword,
    };

ProductsByIdsRequestDTO _$ProductsByIdsRequestDTOFromJson(
        Map<String, dynamic> json) =>
    ProductsByIdsRequestDTO(
      ids: (json['ids'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$ProductsByIdsRequestDTOToJson(
        ProductsByIdsRequestDTO instance) =>
    <String, dynamic>{
      'ids': instance.ids,
    };
