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

  final _$phoneNumberAtom = Atom(name: '_FormLoginStoreBase.phoneNumber');

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

  final _$idTokenAtom = Atom(name: '_FormLoginStoreBase.idToken');

  @override
  String get idToken {
    _$idTokenAtom.reportRead();
    return super.idToken;
  }

  @override
  set idToken(String value) {
    _$idTokenAtom.reportWrite(value, super.idToken, () {
      super.idToken = value;
    });
  }

  final _$verificationIdAtom = Atom(name: '_FormLoginStoreBase.verificationId');

  @override
  String get verificationId {
    _$verificationIdAtom.reportRead();
    return super.verificationId;
  }

  @override
  set verificationId(String value) {
    _$verificationIdAtom.reportWrite(value, super.verificationId, () {
      super.verificationId = value;
    });
  }

  final _$phoneNumberErrorAtom =
      Atom(name: '_FormLoginStoreBase.phoneNumberError');

  @override
  String? get phoneNumberError {
    _$phoneNumberErrorAtom.reportRead();
    return super.phoneNumberError;
  }

  @override
  set phoneNumberError(String? value) {
    _$phoneNumberErrorAtom.reportWrite(value, super.phoneNumberError, () {
      super.phoneNumberError = value;
    });
  }

  final _$handleRequestOTPAsyncAction =
      AsyncAction('_FormLoginStoreBase.handleRequestOTP');

  @override
  Future<void> handleRequestOTP() {
    return _$handleRequestOTPAsyncAction.run(() => super.handleRequestOTP());
  }

  final _$handleVerifyOTPAsyncAction =
      AsyncAction('_FormLoginStoreBase.handleVerifyOTP');

  @override
  Future<void> handleVerifyOTP(String otp) {
    return _$handleVerifyOTPAsyncAction.run(() => super.handleVerifyOTP(otp));
  }

  final _$_FormLoginStoreBaseActionController =
      ActionController(name: '_FormLoginStoreBase');

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
  String toString() {
    return '''
phoneNumber: ${phoneNumber},
idToken: ${idToken},
verificationId: ${verificationId},
phoneNumberError: ${phoneNumberError},
transformPhoneNumber: ${transformPhoneNumber}
    ''';
  }
}
