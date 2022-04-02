import 'package:fruity/data/network/dio_client.dart';
import 'package:fruity/data/network/exceptions/network_exceptions.dart';
import 'package:fruity/dto/user/user_request.dart';
import 'package:fruity/dto/user/user_response.dart';

class AuthAPI {
  final DioClient _dioClient;

  AuthAPI(this._dioClient);

  Future<UserLoginResponseDTO> login(UserLoginRequestDTO req) async {
    try {
      final Map<String, dynamic> response = await _dioClient.post(
        '/login',
        data: <String, dynamic>{
          'phone_number': req.phoneNumber,
          'id_token': req.idToken,
        },
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
