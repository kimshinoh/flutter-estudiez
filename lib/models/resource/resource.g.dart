// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resource.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Resource _$ResourceFromJson(Map<String, dynamic> json) => Resource(
      json['id'] as String,
      json['name'] as String,
      json['type'] as String,
      SubjectClass.fromJson(json['subjectClass'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ResourceToJson(Resource instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'subjectClass': instance.subjectClass,
    };
