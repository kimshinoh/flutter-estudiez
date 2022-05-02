import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:path/path.dart';

part 'upload_request.g.dart';

@JsonSerializable()
class UploadSingleRequest {
  UploadSingleRequest(this.filePath);

  factory UploadSingleRequest.fromJson(Map<String, dynamic> json) =>
      _$UploadSingleRequestFromJson(json);
  Map<String, dynamic> toJson() => _$UploadSingleRequestToJson(this);

  Future<FormData> toFormData() async {
    FormData formData = FormData.fromMap({});
    MultipartFile file = await MultipartFile.fromFile(
      filePath,
      filename: basename(filePath),
      contentType: MediaType("image", basename(filePath)),
    );

    formData.files.add(MapEntry('file', file));

    return formData;
  }

  String filePath;
}
