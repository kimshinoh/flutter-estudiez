// ignore_for_file: unnecessary_this

import 'package:dio/dio.dart';
import 'package:fruity/data/network/apis/user_address/user_address_api.dart';
import 'package:fruity/data/network/dio_client.dart';
import 'package:fruity/data/network/exceptions/network_exceptions.dart';
import 'package:fruity/dto/user_address/user_address_request.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mobx/mobx.dart';

part 'form_create_user_address_store.g.dart';

class FormCreateUserAddressStore = _FormCreateUserAddressStoreBase
    with _$FormCreateUserAddressStore;

abstract class _FormCreateUserAddressStoreBase with Store {
  FormCreateUserAddressValidation validation =
      FormCreateUserAddressValidation();

  UserAddressAPI _userAddressAPI = UserAddressAPI(DioClient(Dio()));

  List<ReactionDisposer> _disposer = [];

  void setupListener() {
    _disposer.add(
      reaction(
        (_) => fullName,
        (String fullName) {
          if (fullName.length > 100) {
            validation.setFullNameError('Họ và tên không được quá 50 ký tự');
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

  @observable
  bool isLoading = false;

  @observable
  String? errorMessage;

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
  Future<void> saveUserAddress() async {
    try {
      isLoading = true;
      CreateUserAddressRequest request = CreateUserAddressRequest(
        fullName: fullName,
        phoneNumber: phoneNumber,
        address: address.address,
        latitude: address.latitude,
        longitude: address.longitude,
        isDefault: isDefault,
        note: note,
      );

      await _userAddressAPI.createUserAddress(request);
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
}

class FormCreateUserAddressValidation = FormCreateUserAddressValidationBase
    with _$FormCreateUserAddressValidation;

abstract class FormCreateUserAddressValidationBase with Store {
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
