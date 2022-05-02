import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';

part 'upload_response.g.dart';

@JsonSerializable()
class UploadSingleResponse {
  UploadSingleResponse({String? link, String? errorMessage, String? fileName}) {
    _link = link;
    _errorMessage = errorMessage;
    _fileName = fileName;
  }

  factory UploadSingleResponse.fromJson(Map<String, dynamic> json) =>
      _$UploadSingleResponseFromJson(json);
  Map<String, dynamic> toJson() => _$UploadSingleResponseToJson(this);

  factory UploadSingleResponse.withError(String errorMessage) =>
      UploadSingleResponse(errorMessage: errorMessage);

  String? _link;
  String? _errorMessage;
  String? _fileName;

  String get link => _link ?? '';

  @JsonKey(name: 'file_name')
  String? get fileName => _fileName;

  @JsonKey(name: 'message')
  String? get errorMessage => _errorMessage;
}
