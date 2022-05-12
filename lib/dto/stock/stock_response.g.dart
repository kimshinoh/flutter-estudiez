// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetStockByProductIdResponse _$GetStockByProductIdResponseFromJson(
        Map<String, dynamic> json) =>
    GetStockByProductIdResponse(
      stock: json['stock'] == null
          ? null
          : Stock.fromJson(json['stock'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetStockByProductIdResponseToJson(
        GetStockByProductIdResponse instance) =>
    <String, dynamic>{
      'stock': instance.stock,
    };
