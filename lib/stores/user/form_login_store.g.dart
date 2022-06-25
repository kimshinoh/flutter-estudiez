// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_login_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FormLoginStore on _FormLoginStoreBase, Store {
  Computed<String>? _$transformPhoneNumberComputed;

  @override
  String get transformPhoneNumber => (_$transformPhoneNumberComputed ??=
          Computed<String>(() => super.transformPhoneNumber,
              name: '_FormLoginStoreBase.transformPhoneNumber'))
      .value;

  late final _$phoneNumberAtom =
      Atom(name: '_FormLoginStoreBase.phoneNumber', context: context);

  @override
  String get phoneNumber {
    _$phoneNumberAtom.reportRead();
    return super.phoneNumber;
  }

  @override
  set phoneNumber(String value) {
    _$phoneNumberAtom.reportWrite(value, super.phoneNumber, () {
      super.phoneNumber = value;
    });
  }

  late final _$smsCodeAtom =
      Atom(name: '_FormLoginStoreBase.smsCode', context: context);

  @override
  String get smsCode {
    _$smsCodeAtom.reportRead();
    return super.smsCode;
  }

  @override
  set smsCode(String value) {
    _$smsCodeAtom.reportWrite(value, super.smsCode, () {
      super.smsCode = value;
    });
  }

  late final _$formErrorStoreAtom =
      Atom(name: '_FormLoginStoreBase.formErrorStore', context: context);

  @override
  FormErrorStore get formErrorStore {
    _$formErrorStoreAtom.reportRead();
    return super.formErrorStore;
  }

  @override
  set formErrorStore(FormErrorStore value) {
    _$formErrorStoreAtom.reportWrite(value, super.formErrorStore, () {
      super.formErrorStore = value;
    });
  }

  late final _$_FormLoginStoreBaseActionController =
      ActionController(name: '_FormLoginStoreBase', context: context);

  @override
  void setPhoneNumber(String phoneNumber) {
    final _$actionInfo = _$_FormLoginStoreBaseActionController.startAction(
        name: '_FormLoginStoreBase.setPhoneNumber');
    try {
      return super.setPhoneNumber(phoneNumber);
    } finally {
      _$_FormLoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validatePhoneNumber(String value) {
    final _$actionInfo = _$_FormLoginStoreBaseActionController.startAction(
        name: '_FormLoginStoreBase.validatePhoneNumber');
    try {
      return super.validatePhoneNumber(value);
    } finally {
      _$_FormLoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateSMSCode(String value) {
    final _$actionInfo = _$_FormLoginStoreBaseActionController.startAction(
        name: '_FormLoginStoreBase.validateSMSCode');
    try {
      return super.validateSMSCode(value);
    } finally {
      _$_FormLoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic dispose() {
    final _$actionInfo = _$_FormLoginStoreBaseActionController.startAction(
        name: '_FormLoginStoreBase.dispose');
    try {
      return super.dispose();
    } finally {
      _$_FormLoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clear() {
    final _$actionInfo = _$_FormLoginStoreBaseActionController.startAction(
        name: '_FormLoginStoreBase.clear');
    try {
      return super.clear();
    } finally {
      _$_FormLoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
phoneNumber: ${phoneNumber},
smsCode: ${smsCode},
formErrorStore: ${formErrorStore},
transformPhoneNumber: ${transformPhoneNumber}
    ''';
  }
}

mixin _$FormErrorStore on _FormErrorStore, Store {
  Computed<bool>? _$hasErrorsInLoginComputed;

  @override
  bool get hasErrorsInLogin => (_$hasErrorsInLoginComputed ??= Computed<bool>(
          () => super.hasErrorsInLogin,
          name: '_FormErrorStore.hasErrorsInLogin'))
      .value;
  Computed<bool>? _$hasErrorsInVerifyComputed;

  @override
  bool get hasErrorsInVerify => (_$hasErrorsInVerifyComputed ??= Computed<bool>(
          () => super.hasErrorsInVerify,
          name: '_FormErrorStore.hasErrorsInVerify'))
      .value;

  late final _$phoneNumberAtom =
      Atom(name: '_FormErrorStore.phoneNumber', context: context);

  @override
  String? get phoneNumber {
    _$phoneNumberAtom.reportRead();
    return super.phoneNumber;
  }

  @override
  set phoneNumber(String? value) {
    _$phoneNumberAtom.reportWrite(value, super.phoneNumber, () {
      super.phoneNumber = value;
    });
  }

  late final _$smsCodeAtom =
      Atom(name: '_FormErrorStore.smsCode', context: context);

  @override
  String? get smsCode {
    _$smsCodeAtom.reportRead();
    return super.smsCode;
  }

  @override
  set smsCode(String? value) {
    _$smsCodeAtom.reportWrite(value, super.smsCode, () {
      super.smsCode = value;
    });
  }

  late final _$_FormErrorStoreActionController =
      ActionController(name: '_FormErrorStore', context: context);

  @override
  void clear() {
    final _$actionInfo = _$_FormErrorStoreActionController.startAction(
        name: '_FormErrorStore.clear');
    try {
      return super.clear();
    } finally {
      _$_FormErrorStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
phoneNumber: ${phoneNumber},
smsCode: ${smsCode},
hasErrorsInLogin: ${hasErrorsInLogin},
hasErrorsInVerify: ${hasErrorsInVerify}
    ''';
  }
}
