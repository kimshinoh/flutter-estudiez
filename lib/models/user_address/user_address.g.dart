// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserAddress _$UserAddressFromJson(Map<String, dynamic> json) => UserAddress(
      id: json['id'] as String,
      userId: json['user_id'] as String,
      phoneNumber: json['phone_number'] as String,
      address: json['address'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      isDefault: json['is_default'] as bool,
      fullName: json['full_name'] as String,
      note: json['note'] as String?,
    );

Map<String, dynamic> _$UserAddressToJson(UserAddress instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'is_default': instance.isDefault,
      'phone_number': instance.phoneNumber,
      'full_name': instance.fullName,
      'address': instance.address,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'note': instance.note,
    };
