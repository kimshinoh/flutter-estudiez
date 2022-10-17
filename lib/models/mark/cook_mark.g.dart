// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cook_mark.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CookMark _$CookMarkFromJson(Map<String, dynamic> json) => CookMark(
      json['subject'] as String?,
      json['subjectId'] as String?,
      (json['marks'] as List<dynamic>)
          .map((e) => Mark.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CookMarkToJson(CookMark instance) => <String, dynamic>{
      'subject': instance.subject,
      'subjectId': instance.subjectId,
      'marks': instance.marks,
    };
