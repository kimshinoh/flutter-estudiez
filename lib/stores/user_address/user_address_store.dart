import 'package:collection/collection.dart';
import 'package:dio/dio.dart';
import 'package:fruity/data/network/apis/user_address/user_address_api.dart';
import 'package:fruity/data/network/dio_client.dart';
import 'package:fruity/data/network/exceptions/network_exceptions.dart';
import 'package:fruity/dto/user_address/user_address_request.dart';
import 'package:fruity/dto/user_address/user_address_response.dart';
import 'package:fruity/models/user_address/user_address.dart';
import 'package:json_annotation/json_annotation.dart';
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

  @computed
  List<UserAddress> get nonDefaultAddresses => userAddresses
      .where(
        (UserAddress address) => !address.isDefault,
      )
      .toList();

  @computed
  bool get hasNonDefaultAddress => nonDefaultAddresses.isNotEmpty;

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

@JsonSerializable()
class Address {
  double latitude;
  double longitude;
  String address;

  Address({
    required this.address,
    required this.latitude,
    required this.longitude,
  });

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);

  Map<String, dynamic> toJson() => _$AddressToJson(this);
}
