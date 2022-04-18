// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyPaymentsResponse _$MyPaymentsResponseFromJson(Map<String, dynamic> json) =>
    MyPaymentsResponse(
      payments: (json['payments'] as List<dynamic>)
          .map((e) => Payment.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MyPaymentsResponseToJson(MyPaymentsResponse instance) =>
    <String, dynamic>{
      'payments': instance.payments,
    };
