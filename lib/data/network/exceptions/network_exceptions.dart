class NetworkException implements Exception {
  NetworkException({this.message, this.statusCode});

  String? message;
  int? statusCode;
}

class AuthException extends NetworkException {
  AuthException({String? message, int? statusCode})
      : super(message: message, statusCode: statusCode);
}
