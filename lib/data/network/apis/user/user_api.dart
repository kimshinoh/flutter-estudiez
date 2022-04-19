import 'package:fruity/data/network/dio_client.dart';
import 'package:fruity/dto/user/user_request.dart';

class UserAPI {
  final DioClient _dioClient;

  UserAPI(this._dioClient);

  Future<void> updateFCMToken(UpdateFCMTokenRequest req) async {
    await _dioClient.put(
      '/users/update-my-fcm-token',
      data: req.toJson(),
    );
  }
}
