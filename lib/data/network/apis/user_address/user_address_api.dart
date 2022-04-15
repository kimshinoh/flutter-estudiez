import 'package:fruity/data/network/dio_client.dart';
import 'package:fruity/data/network/exceptions/network_exceptions.dart';
import 'package:fruity/dto/user_address/user_address_request.dart';
import 'package:fruity/dto/user_address/user_address_response.dart';

class UserAddressAPI {
  DioClient _dioClient;
  UserAddressAPI(this._dioClient);

  Future<MyAddressesResponse> getMyAddresses(MyAddressesRequest req) async {
    try {
      final Map<String, dynamic> response = await _dioClient
          .get('/user-addresses', queryParameters: req.toJson());

      return MyAddressesResponse.fromJson(response);
    } catch (e) {
      if (e is NetworkException) {
        return MyAddressesResponse.withError(
          e.message ?? 'Có lỗi xảy ra',
        );
      }
      return MyAddressesResponse.withError(e.toString());
    }
  }
}
