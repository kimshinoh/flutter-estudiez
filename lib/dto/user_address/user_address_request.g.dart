// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_address_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyAddressesRequest _$MyAddressesRequestFromJson(Map<String, dynamic> json) =>
    MyAddressesRequest();

Map<String, dynamic> _$MyAddressesRequestToJson(MyAddressesRequest instance) =>
    <String, dynamic>{};

CreateUserAddressRequest _$CreateUserAddressRequestFromJson(
        Map<String, dynamic> json) =>
    CreateUserAddressRequest(
      fullName: json['full_name'] as String,
      phoneNumber: json['phone_number'] as String,
      address: json['address'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      isDefault: json['is_default'] as bool,
      note: json['note'] as String?,
    );

Map<String, dynamic> _$CreateUserAddressRequestToJson(
        CreateUserAddressRequest instance) =>
    <String, dynamic>{
      'full_name': instance.fullName,
      'phone_number': instance.phoneNumber,
      'address': instance.address,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'note': instance.note,
      'is_default': instance.isDefault,
    };

GetUserAddressRequest _$GetUserAddressRequestFromJson(
        Map<String, dynamic> json) =>
    GetUserAddressRequest(
      json['id'] as String,
    );

Map<String, dynamic> _$GetUserAddressRequestToJson(
        GetUserAddressRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
    };

UpdateUserAddressRequest _$UpdateUserAddressRequestFromJson(
        Map<String, dynamic> json) =>
    UpdateUserAddressRequest(
      id: json['id'] as String,
      fullName: json['full_name'] as String,
      phoneNumber: json['phone_number'] as String,
      address: json['address'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      isDefault: json['is_default'] as bool,
      userId: json['user_id'] as String,
      note: json['note'] as String?,
    );

Map<String, dynamic> _$UpdateUserAddressRequestToJson(
        UpdateUserAddressRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'full_name': instance.fullName,
      'phone_number': instance.phoneNumber,
      'address': instance.address,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'note': instance.note,
      'user_id': instance.userId,
      'is_default': instance.isDefault,
    };

RemoveUserAddressRequest _$RemoveUserAddressRequestFromJson(
        Map<String, dynamic> json) =>
    RemoveUserAddressRequest(
      json['id'] as String,
      json['user_id'] as String,
    );

Map<String, dynamic> _$RemoveUserAddressRequestToJson(
        RemoveUserAddressRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
    };
