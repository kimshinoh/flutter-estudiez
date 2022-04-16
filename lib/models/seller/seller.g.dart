// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seller.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Seller _$SellerFromJson(Map<String, dynamic> json) => Seller(
      id: json['id'] as String,
      name: json['name'] as String,
      logo: json['logo'] as String,
      banner: json['banner'] as String,
      type: json['type'] as String,
      description: json['description'] as String,
      headQuarter: json['head_quarter'] as String,
      rating: (json['rating'] as num).toDouble(),
      totalVote: json['total_vote'] as int,
      availableTime: AvailableTime.fromJson(
        json['available_time'] as Map<String, dynamic>,
      ),
      email: json['email'] as String?,
      phoneNumber: json['phone_number'] as String?,
      note: json['note'] as String?,
    );

Map<String, dynamic> _$SellerToJson(Seller instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'logo': instance.logo,
      'banner': instance.banner,
      'type': instance.type,
      'description': instance.description,
      'head_quarter': instance.headQuarter,
      'rating': instance.rating,
      'total_vote': instance.totalVote,
      'available_time': instance.availableTime.toJson(),
      'phone_number': instance.phoneNumber,
      'note': instance.note,
      'email': instance.email,
    };

AvailableTime _$AvailableTimeFromJson(Map<String, dynamic> json) =>
    AvailableTime(
      openTime: json['open_time'] as String? ?? '08.00',
      closeTime: json['close_time'] as String? ?? '21.00',
      holidays: (json['holidays'] as List<dynamic>?)
          ?.map((e) => Holiday.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AvailableTimeToJson(AvailableTime instance) =>
    <String, dynamic>{
      'open_time': instance.openTime,
      'close_time': instance.closeTime,
      'holidays': instance.holidays?.map((Holiday e) => e.toJson()).toList(),
    };

Holiday _$HolidayFromJson(Map<String, dynamic> json) => Holiday(
      name: json['name'] as String,
      startDate: DateTime.parse(json['start_date'] as String),
      endDate: DateTime.parse(json['end_date'] as String),
    );

Map<String, dynamic> _$HolidayToJson(Holiday instance) => <String, dynamic>{
      'name': instance.name,
      'start_date': instance.startDate.toIso8601String(),
      'end_date': instance.endDate.toIso8601String(),
    };
