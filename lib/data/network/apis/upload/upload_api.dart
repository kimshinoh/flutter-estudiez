import 'package:dio/dio.dart';
import 'package:fruity/data/network/dio_client.dart';
import 'package:fruity/data/network/exceptions/network_exceptions.dart';
import 'package:fruity/dto/upload/upload_request.dart';
import 'package:fruity/dto/upload/upload_response.dart';

class UploadAPI {
  final DioClient _dioClient;

  UploadAPI(this._dioClient);

  Future<UploadSingleResponse> uploadSingle(UploadSingleRequest req) async {
    try {
      FormData formData = await req.toFormData();

      final res = await _dioClient.post(
        '/upload/file',
        formData: formData,
      );

      return UploadSingleResponse.fromJson(res);
    } catch (e) {
      if (e is NetworkException) {
        return UploadSingleResponse.withError(
          e.message ?? 'Có lỗi xảy ra',
        );
      }
      return UploadSingleResponse.withError(e.toString());
    }
  }
}
