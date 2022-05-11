// ignore_for_file: unnecessary_this

import 'package:dio/dio.dart';
import 'package:fruity/data/network/apis/user_address/user_address_api.dart';
import 'package:fruity/data/network/dio_client.dart';
import 'package:fruity/data/network/exceptions/network_exceptions.dart';
import 'package:fruity/dto/user_address/user_address_request.dart';
import 'package:fruity/dto/user_address/user_address_response.dart';
import 'package:fruity/models/user_address/user_address.dart';
import 'package:mobx/mobx.dart';

import 'user_address_store.dart';

part 'form_update_user_address_store.g.dart';

class FormUpdateUserAddressStore = _FormUpdateUserAddressStoreBase
    with _$FormUpdateUserAddressStore;

abstract class _FormUpdateUserAddressStoreBase with Store {
  FormUpdateUserAddressValidation validation =
      FormUpdateUserAddressValidation();

  UserAddressAPI _userAddressAPI = UserAddressAPI(DioClient(Dio()));

  List<ReactionDisposer> _disposer = [];

  _FormUpdateUserAddressStoreBase(this.id);

  void setupListener() {
    _disposer.add(
      reaction(
        (_) => fullName,
        (String fullName) {
          if (fullName.isEmpty) {
            validation.setFullNameError('Vui lòng nhập họ và tên');
          } else {
            validation.setFullNameError(null);
          }
        },
      ),
    );

    _disposer.add(
      reaction((_) => phoneNumber, (String phone) {
        final RegExp regex = RegExp(r'^\d{10}$');
        if (phone.length > 10 || !regex.hasMatch(phone)) {
          validation.setPhoneNumberError('Số điện thoại không hợp lệ');
        } else {
          validation.setPhoneNumberError(null);
        }
      }),
    );
  }

  @action
  Future<void> getUserAddress() async {
    try {
      final GetUserAddressResponse res =
          await _userAddressAPI.getUserAddress(GetUserAddressRequest(id));

      final UserAddress? _address = res.userAddress;

      if (res.errorMessage != null) {
        errorMessage = res.errorMessage;
      } else if (_address == null) {
        errorMessage = 'Địa chỉ không tồn tại';
      } else {
        fullName = _address.fullName;
        phoneNumber = _address.phoneNumber;
        isDefault = _address.isDefault;
        note = _address.note ?? "";
        address = Address(
            address: _address.address,
            latitude: _address.latitude,
            longitude: _address.longitude);
      }
    } catch (e) {
      if (e is NetworkException) {
        errorMessage = e.message;
      } else {
        errorMessage = 'Đã có lỗi xảy ra';
      }
    } finally {
      isLoading = false;
    }
  }

  @observable
  bool isLoading = true;

  @observable
  String? errorMessage;

  @observable
  String id = "";

  @observable
  String fullName = '';
  @action
  void setFullName(String fullName) {
    this.fullName = fullName;
  }

  @observable
  String phoneNumber = '';

  @action
  void setPhoneNumber(String phoneNumber) {
    this.phoneNumber = phoneNumber;
  }

  @observable
  String note = '';

  @action
  void setNote(String note) {
    this.note = note;
  }

  @observable
  Address address = Address(address: "", latitude: 0, longitude: 0);
  void setAddress(Address address) {
    this.address = address;
  }

  @observable
  bool isDefault = false;
  @action
  void setIsDefault() {
    this.isDefault = !this.isDefault;
  }

  @computed
  bool get isValid {
    return validation.isValid &&
        fullName.isNotEmpty &&
        phoneNumber.isNotEmpty &&
        address.address.isNotEmpty;
  }

  @action
  Future<void> updateUserAddress(String userId) async {
    try {
      isLoading = true;
      final UpdateUserAddressRequest request = UpdateUserAddressRequest(
        id: id,
        fullName: fullName,
        phoneNumber: phoneNumber,
        address: address.address,
        latitude: address.latitude,
        longitude: address.longitude,
        isDefault: isDefault,
        note: note,
        userId: userId,
      );

      await _userAddressAPI.updateUserAddress(request);
    } catch (e) {
      if (e is NetworkException) {
        errorMessage = e.message;
      } else {
        errorMessage = e.toString();
      }
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<void> removeUserAddress(String userId) async {
    try {
      isLoading = true;
      await _userAddressAPI
          .removeUserAddress(RemoveUserAddressRequest(id, userId));
    } on NetworkException catch (e) {
      errorMessage = e.message;
    } finally {
      isLoading = false;
    }
  }
}

class FormUpdateUserAddressValidation = FormUpdateUserAddressValidationBase
    with _$FormUpdateUserAddressValidation;

abstract class FormUpdateUserAddressValidationBase with Store {
  @observable
  String? fullNameError;
  @action
  setFullNameError(String? fullNameError) {
    this.fullNameError = fullNameError;
  }

  @observable
  String? phoneNumberError;
  @action
  setPhoneNumberError(String? phoneNumberError) {
    this.phoneNumberError = phoneNumberError;
  }

  @computed
  bool get isValid {
    return fullNameError == null && phoneNumberError == null;
  }
}
