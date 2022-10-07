import 'dart:async';
import 'dart:convert';

import 'package:fruity/data/network/constants/endpoints.dart';
import 'package:fruity/data/network/exceptions/network_exceptions.dart';
import 'package:http/http.dart' as http;

class RestClient {
  final JsonDecoder _decoder = const JsonDecoder();
  final JsonEncoder _encoder = const JsonEncoder();
  // Get:-----------------------------------------------------------------------
  Future<http.Response> get(String path, {Map<String, String>? headers}) async {
    return http
        .get(
          Uri.parse(
            '${Endpoints.baseUrl}$path',
          ),
          headers: headers,
        );
  }

  // Post:----------------------------------------------------------------------
  Future<Map<String, dynamic>> post(String path,
      {Map<String, String>? headers,
      Map<String, dynamic>? body,
      Encoding? encoding}) {
    return http
        .post(
          Uri.parse(
            '${Endpoints.baseUrl}$path',
          ),
          body: _encoder.convert(body),
          headers: headers,
          encoding: encoding,
        )
        .then(_createResponse);
  }

  // Put:----------------------------------------------------------------------
  Future<Map<String, dynamic>> put(String path,
      {Map<String, String>? headers, Object? body, Encoding? encoding}) {
    return http
        .put(
          Uri.parse(
            '${Endpoints.baseUrl}$path',
          ),
          body: _encoder.convert(body),
          headers: headers,
          encoding: encoding,
        )
        .then(_createResponse);
  }

  // Delete:----------------------------------------------------------------------
  Future<Map<String, dynamic>> delete(String path,
      {Map<String, String>? headers, Object? body, Encoding? encoding}) {
    return http
        .delete(
          Uri.parse(
            '${Endpoints.baseUrl}$path',
          ),
          body: _encoder.convert(body),
          headers: headers,
          encoding: encoding,
        )
        .then(_createResponse);
  }

  // Response:------------------------------------------------------------------
  Map<String, dynamic> _createResponse(http.Response response) {
    final String res = response.body;
    final int statusCode = response.statusCode;
    final Map<String, dynamic> body =
        _decoder.convert(res) as Map<String, dynamic>;
    final String message = body['message'].toString();
    if (statusCode < 200 || statusCode > 400) {
      throw NetworkException(
        message: message,
        statusCode: statusCode,
      );
    }

    return body;
  }
}
