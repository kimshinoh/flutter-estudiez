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
