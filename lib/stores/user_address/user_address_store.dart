import 'package:collection/collection.dart';
import 'package:dio/dio.dart';
import 'package:fruity/data/network/apis/user_address/user_address_api.dart';
import 'package:fruity/data/network/dio_client.dart';
import 'package:fruity/data/network/exceptions/network_exceptions.dart';
import 'package:fruity/dto/user_address/user_address_request.dart';
import 'package:fruity/dto/user_address/user_address_response.dart';
import 'package:fruity/models/user_address/user_address.dart';
import 'package:mobx/mobx.dart';

part 'user_address_store.g.dart';

class UserAddressStore = _UserAddressStoreBase with _$UserAddressStore;

abstract class _UserAddressStoreBase with Store {
  UserAddressAPI userAddressAPI = UserAddressAPI(DioClient(Dio()));

  @observable
  List<UserAddress> userAddresses = [];

  @observable
  String? error;

  @observable
  bool loading = false;

  @computed
  UserAddress? get defaultAddress => userAddresses.firstWhereOrNull(
        (UserAddress address) => address.isDefault,
      );

  @action
  void clearUserAddresses() {
    userAddresses = [];
  }

  @action
  Future<void> getUserAddresses() async {
    try {
      loading = true;
      final MyAddressesResponse res =
          await userAddressAPI.getMyAddresses(MyAddressesRequest());
      if (res.errorMessage != null) {
        error = res.errorMessage;
      } else {
        userAddresses = res.userAddresses;
      }
    } catch (e) {
      if (e is NetworkException) {
        error = e.message ?? 'Có lỗi xảy ra';
      } else {
        error = e.toString();
      }
    } finally {
      loading = false;
    }
  }
}