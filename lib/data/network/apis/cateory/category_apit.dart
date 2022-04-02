import 'package:fruity/data/network/exceptions/network_exceptions.dart';
import 'package:fruity/data/network/rest_client.dart';
import 'package:fruity/dto/user/user_request.dart';
import 'package:fruity/dto/user/user_response.dart';

class AuthAPI {
  final RestClient _restClient;

  AuthAPI(this._restClient);

  Future<UserLoginResponseDTO> getParentCategories(
      UserLoginRequestDTO req) async {
    try {
      final Map<String, dynamic> response = await _restClient.get(
        '/categories/parent',
      );

      return UserLoginResponseDTO.fromJson(response);
    } catch (e) {
      if (e is NetworkException) {
        return UserLoginResponseDTO.withError(
          e.message ?? 'Có lỗi xảy ra',
        );
      }
      return UserLoginResponseDTO.withError(e.toString());
    }
  }

  Future<UserLoginResponseDTO> getChildCategories(
      UserLoginRequestDTO req) async {
    try {
      final Map<String, dynamic> response = await _restClient.get(
        '/categories/child',
      );

      return UserLoginResponseDTO.fromJson(response);
    } catch (e) {
      if (e is NetworkException) {
        return UserLoginResponseDTO.withError(
          e.message ?? 'Có lỗi xảy ra',
        );
      }
      return UserLoginResponseDTO.withError(e.toString());
    }
  }
}
