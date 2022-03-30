import 'package:fruity/data/network/rest_client.dart';
import 'package:fruity/dto/user/user_request.dart';
import 'package:fruity/dto/user/user_response.dart';

class AuthAPI {
  RestClient _restClient;

  AuthAPI(this._restClient);

  Future<UserLoginResponseDTO> login(UserLoginRequestDTO req) async {
    try {
      final Map<String, dynamic> response =
          await _restClient.post('/login', body: <String, dynamic>{
        'phone_number': req.phoneNumber,
        'id_token': req.idToken,
      });

      return UserLoginResponseDTO.fromJson(response);
    } catch (e) {
      return UserLoginResponseDTO.withError(e.toString());
    }
  }
}
