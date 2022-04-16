// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_address_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyAddressesResponse _$MyAddressesResponseFromJson(Map<String, dynamic> json) =>
    MyAddressesResponse(
      errorMessage: json['message'] as String?,
      userAddresses: (json['user_addresses'] as List<dynamic>)
          .map((e) => UserAddress.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MyAddressesResponseToJson(
        MyAddressesResponse instance) =>
    <String, dynamic>{
      'user_addresses':
          instance.userAddresses.map((UserAddress e) => e.toJson()).toList(),
      'message': instance.errorMessage,
    };
