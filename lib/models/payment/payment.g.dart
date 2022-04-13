// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Payment _$PaymentFromJson(Map<String, dynamic> json) => Payment(
      id: json['id'] as String,
      userId: json['user_id'] as String,
      provider: json['provider'] as String,
      name: json['name'] as String,
      accountNo: json['account_no'] as String,
      status: json['status'] as String,
      logo: json['logo'] as String,
    );

Map<String, dynamic> _$PaymentToJson(Payment instance) => <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'name': instance.name,
      'provider': instance.provider,
      'status': instance.status,
      'account_no': instance.accountNo,
      'logo': instance.logo,
    };
