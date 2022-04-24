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
