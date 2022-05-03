// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seller_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListSellerResponse _$ListSellerResponseFromJson(Map<String, dynamic> json) =>
    ListSellerResponse(
      sellers: (json['sellers'] as List<dynamic>)
          .map((e) => Seller.fromJson(e as Map<String, dynamic>))
          .toList(),
      errorMessage: json['errorMessage'] as String?,
    );

Map<String, dynamic> _$ListSellerResponseToJson(ListSellerResponse instance) =>
    <String, dynamic>{
      'sellers': instance.sellers,
      'errorMessage': instance.errorMessage,
    };

SellerResponse _$SellerResponseFromJson(Map<String, dynamic> json) =>
    SellerResponse(
      seller: json['seller'] == null
          ? null
          : Seller.fromJson(json['seller'] as Map<String, dynamic>),
      errorMessage: json['errorMessage'] as String?,
    );

Map<String, dynamic> _$SellerResponseToJson(SellerResponse instance) =>
    <String, dynamic>{
      'seller': instance.seller?.toJson(),
      'errorMessage': instance.errorMessage,
    };

ListProductsBySellerResponse _$ListProductsBySellerResponseFromJson(
        Map<String, dynamic> json) =>
    ListProductsBySellerResponse(
      products: (json['products'] as List<dynamic>)
          .map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
      errorMessage: json['message'] as String?,
    );

Map<String, dynamic> _$ListProductsBySellerResponseToJson(
        ListProductsBySellerResponse instance) =>
    <String, dynamic>{
      'products': instance.products.map((e) => e.toJson()).toList(),
      'message': instance.errorMessage,
    };
