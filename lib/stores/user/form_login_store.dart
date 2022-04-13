import 'package:mobx/mobx.dart';

part 'form_login_store.g.dart';

class FormLoginStore = _FormLoginStoreBase with _$FormLoginStore;

abstract class _FormLoginStoreBase with Store {
  @observable
  late String phoneNumber = '';

  @observable
  late String smsCode = '';

  @observable
  FormErrorStore formErrorStore = FormErrorStore();

  late List<ReactionDisposer> _disposers;

  @action
  void setPhoneNumber(String phoneNumber) {
    this.phoneNumber = phoneNumber;
  }

  void setSMSCode(String smsCode) {
    this.smsCode = smsCode;
  }

  @computed
  String get transformPhoneNumber => '+84${phoneNumber.substring(1)}';

  void setupValidations() {
    _disposers = [
      reaction((_) => phoneNumber, validatePhoneNumber),
      reaction((_) => smsCode, validateSMSCode),
    ];
  }

  @action
  void validatePhoneNumber(String value) {
    if (value.isEmpty) {
      formErrorStore.phoneNumber = 'Vui lòng nhập số điện thoại';
    } else if (value.length < 10) {
      formErrorStore.phoneNumber = 'Số điện thoại không hợp lệ';
    } else {
      formErrorStore.phoneNumber = null;
    }
  }

  @action
  void validateSMSCode(String value) {
    if (value.isEmpty) {
      formErrorStore.smsCode = 'Vui lòng nhập mã xác thực';
    } else if (value.length < 6) {
      formErrorStore.smsCode = 'Mã xác thực không hợp lệ';
    } else {
      formErrorStore.smsCode = null;
    }
  }

  @action
  dispose() {
    for (final ReactionDisposer d in _disposers) {
      d();
    }
  }

  @action
  void clear() {
    phoneNumber = '';
    smsCode = '';
    formErrorStore.clear();
  }
}

class FormErrorStore = _FormErrorStore with _$FormErrorStore;

abstract class _FormErrorStore with Store {
  @observable
  String? phoneNumber;

  @observable
  String? smsCode;

  @computed
  bool get hasErrorsInLogin => phoneNumber != null || smsCode != null;

  @computed
  bool get hasErrorsInVerify => phoneNumber != null;

  @action
  void clear() {
    phoneNumber = null;
    smsCode = null;
  }
}
