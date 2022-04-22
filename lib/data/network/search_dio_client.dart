import 'package:dio/dio.dart';
import 'package:fruity/data/network/constants/endpoints.dart';
import 'package:fruity/data/network/exceptions/network_exceptions.dart';

class SearchDioClient {
  // dio instance
  final Dio _dio;

  // injecting dio instance
  SearchDioClient(this._dio) {
    _dio.options.baseUrl = Endpoints.elasticSearchUrl;
    _dio.options.connectTimeout = 5000;
    _dio.options.receiveTimeout = 5000;
    _dio.options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': Endpoints.authHeader,
    };
    _dio.options.validateStatus = (int? status) {
      return status! <= 500;
    };
  }

  // Post:----------------------------------------------------------------------
  Future<Map<String, dynamic>> post(
    String uri, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    return _dio
        .post(
          uri,
          data: data,
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken,
          onSendProgress: onSendProgress,
          onReceiveProgress: onReceiveProgress,
        )
        .then(_createResponse)
        .catchError((err) {
      _handleError(err);
    });
  }

  

  Map<String, dynamic> _createResponse(Response response) {
    final int? statusCode = response.statusCode;
    if (statusCode == 404) {
      throw NetworkException(
        message: 'Không tìm thấy đường dẫn',
      );
    }
    if (statusCode != null && (statusCode < 200 || statusCode > 400)) {
      late String message = '';
      if (response.data != null) {
        if (response.data.runtimeType == String) {
          message = response.data as String;
        } else {
          message = response.data['message'] as String;
        }
      }

      throw NetworkException(
        message: message,
        statusCode: statusCode,
      );
    }
    return response.data as Map<String, dynamic>;
  }

  void _handleError(dynamic error) {
    if (error is DioError) {
      if (error.message.contains('SocketException')) {
        throw NetworkException(
          message: 'Không thể kết nối mạng',
        );
      }
      if (error.message.contains('TimeoutException')) {
        throw NetworkException(
          message: 'Kết nối mạng quá chậm',
        );
      }
      if (error.message.contains('CancelException')) {
        throw NetworkException(
          message: 'Hủy kết nối mạng',
        );
      }
    }
    if (error is NetworkException) {
      throw error;
    }
    throw Exception(error);
  }
}
