// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sell_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListSellerRequest _$ListSellerRequestFromJson(Map<String, dynamic> json) =>
    ListSellerRequest(
      ids: (json['ids'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$ListSellerRequestToJson(ListSellerRequest instance) =>
    <String, dynamic>{
      'ids': instance.ids,
    };

ListProductsBySellerRequest _$ListProductsBySellerRequestFromJson(
        Map<String, dynamic> json) =>
    ListProductsBySellerRequest()..sellerId = json['sellerId'] as String?;

Map<String, dynamic> _$ListProductsBySellerRequestToJson(
        ListProductsBySellerRequest instance) =>
    <String, dynamic>{
      'sellerId': instance.sellerId,
    };
