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
      'user_addresses': instance.userAddresses.map((e) => e.toJson()).toList(),
      'message': instance.errorMessage,
    };

CreateUserAddressResponse _$CreateUserAddressResponseFromJson(
        Map<String, dynamic> json) =>
    CreateUserAddressResponse(
      errorMessage: json['message'] as String?,
      userAddress: json['user_address'] == null
          ? null
          : UserAddress.fromJson(json['user_address'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CreateUserAddressResponseToJson(
        CreateUserAddressResponse instance) =>
    <String, dynamic>{
      'message': instance.errorMessage,
      'user_address': instance.userAddress,
    };
