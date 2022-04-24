import 'package:fruity/data/network/dio_client.dart';
import 'package:fruity/data/network/exceptions/network_exceptions.dart';
import 'package:fruity/dto/user_address/user_address_request.dart';
import 'package:fruity/dto/user_address/user_address_response.dart';

class UserAddressAPI {
  final DioClient _dioClient;
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

  Future<CreateUserAddressResponse> createUserAddress(
      CreateUserAddressRequest req) async {
    try {
      final Map<String, dynamic> response =
          await _dioClient.post('/user-addresses', data: req.toJson());

      return CreateUserAddressResponse.fromJson(response);
    } catch (e) {
      if (e is NetworkException) {
        return CreateUserAddressResponse.withError(
          e.message ?? 'Có lỗi xảy ra',
        );
      }
      return CreateUserAddressResponse.withError(e.toString());
    }
  }
}
