import 'package:fruity/data/network/dio_client.dart';
import 'package:fruity/data/network/exceptions/network_exceptions.dart';
import 'package:fruity/dto/user/user_request.dart';
import 'package:fruity/dto/user/user_response.dart';

class UserAPI {
  final DioClient _dioClient;

  UserAPI(this._dioClient);

  Future<void> updateFCMToken(UpdateFCMTokenRequest req) async {
    await _dioClient.put(
      '/users/update-my-fcm-token',
      data: req.toJson(),
    );
  }

  Future<UpdateProfileResponse> updateProfile(UpdateProfileRequest req) async {
    try {
      final res = await _dioClient.put(
        '/users/update-my-profile',
        data: req.toJson(),
      );

      return UpdateProfileResponse.fromJson(res);
    } catch (e) {
      if (e is NetworkException) {
        return UpdateProfileResponse.withError(
          e.message ?? 'Có lỗi xảy ra',
        );
      }
      return UpdateProfileResponse.withError(e.toString());
    }
  }
}
