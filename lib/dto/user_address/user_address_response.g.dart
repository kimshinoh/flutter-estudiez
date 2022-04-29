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

GetUserAddressResponse _$GetUserAddressResponseFromJson(
        Map<String, dynamic> json) =>
    GetUserAddressResponse(
      errorMessage: json['message'] as String?,
      userAddress: json['user_address'] == null
          ? null
          : UserAddress.fromJson(json['user_address'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetUserAddressResponseToJson(
        GetUserAddressResponse instance) =>
    <String, dynamic>{
      'message': instance.errorMessage,
      'user_address': instance.userAddress?.toJson(),
    };

UpdateUserAddressResponse _$UpdateUserAddressResponseFromJson(
        Map<String, dynamic> json) =>
    UpdateUserAddressResponse(
      errorMessage: json['message'] as String?,
      userAddress: json['user_address'] == null
          ? null
          : UserAddress.fromJson(json['user_address'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UpdateUserAddressResponseToJson(
        UpdateUserAddressResponse instance) =>
    <String, dynamic>{
      'message': instance.errorMessage,
      'user_address': instance.userAddress,
    };

RemoveUserAddressResponse _$RemoveUserAddressResponseFromJson(
        Map<String, dynamic> json) =>
    RemoveUserAddressResponse(
      errorMessage: json['message'] as String?,
    );

Map<String, dynamic> _$RemoveUserAddressResponseToJson(
        RemoveUserAddressResponse instance) =>
    <String, dynamic>{
      'message': instance.errorMessage,
    };
