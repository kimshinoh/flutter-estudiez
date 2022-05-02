// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UploadSingleResponse _$UploadSingleResponseFromJson(
        Map<String, dynamic> json) =>
    UploadSingleResponse(
      link: json['link'] as String?,
      errorMessage: json['message'] as String?,
      fileName: json['file_name'] as String?,
    );

Map<String, dynamic> _$UploadSingleResponseToJson(
        UploadSingleResponse instance) =>
    <String, dynamic>{
      'link': instance.link,
      'file_name': instance.fileName,
      'message': instance.errorMessage,
    };
