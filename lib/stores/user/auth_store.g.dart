// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AuthStore on _AuthStoreBase, Store {
  Computed<bool>? _$canLoginComputed;

  @override
  bool get canLogin => (_$canLoginComputed ??=
          Computed<bool>(() => super.canLogin, name: '_AuthStoreBase.canLogin'))
      .value;

  final _$userAtom = Atom(name: '_AuthStoreBase.user');

  @override
  UserModel.User? get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(UserModel.User? value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  final _$tokenAtom = Atom(name: '_AuthStoreBase.token');

  @override
  String? get token {
    _$tokenAtom.reportRead();
    return super.token;
  }

  @override
  set token(String? value) {
    _$tokenAtom.reportWrite(value, super.token, () {
      super.token = value;
    });
  }

  final _$expiredAtAtom = Atom(name: '_AuthStoreBase.expiredAt');

  @override
  int? get expiredAt {
    _$expiredAtAtom.reportRead();
    return super.expiredAt;
  }

  @override
  set expiredAt(int? value) {
    _$expiredAtAtom.reportWrite(value, super.expiredAt, () {
      super.expiredAt = value;
    });
  }

  final _$verificationIdAtom = Atom(name: '_AuthStoreBase.verificationId');

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

  final _$isLoadingAtom = Atom(name: '_AuthStoreBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$isLoadingSentCodeAtom =
      Atom(name: '_AuthStoreBase.isLoadingSentCode');

  @override
  bool get isLoadingSentCode {
    _$isLoadingSentCodeAtom.reportRead();
    return super.isLoadingSentCode;
  }

  @override
  set isLoadingSentCode(bool value) {
    _$isLoadingSentCodeAtom.reportWrite(value, super.isLoadingSentCode, () {
      super.isLoadingSentCode = value;
    });
  }

  final _$isLoggedInAtom = Atom(name: '_AuthStoreBase.isLoggedIn');

  @override
  bool get isLoggedIn {
    _$isLoggedInAtom.reportRead();
    return super.isLoggedIn;
  }

  @override
  set isLoggedIn(bool value) {
    _$isLoggedInAtom.reportWrite(value, super.isLoggedIn, () {
      super.isLoggedIn = value;
    });
  }

  final _$errorMessageAtom = Atom(name: '_AuthStoreBase.errorMessage');

  @override
  String get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  final _$isSuccessAtom = Atom(name: '_AuthStoreBase.isSuccess');

  @override
  bool get isSuccess {
    _$isSuccessAtom.reportRead();
    return super.isSuccess;
  }

  @override
  set isSuccess(bool value) {
    _$isSuccessAtom.reportWrite(value, super.isSuccess, () {
      super.isSuccess = value;
    });
  }

  final _$handleRequestOTPAsyncAction =
      AsyncAction('_AuthStoreBase.handleRequestOTP');

  @override
  Future<void> handleRequestOTP() {
    return _$handleRequestOTPAsyncAction.run(() => super.handleRequestOTP());
  }

  final _$handleVerifyOTPAsyncAction =
      AsyncAction('_AuthStoreBase.handleVerifyOTP');

  @override
  Future<void> handleVerifyOTP() {
    return _$handleVerifyOTPAsyncAction.run(() => super.handleVerifyOTP());
  }

  final _$handleLoginAsyncAction = AsyncAction('_AuthStoreBase.handleLogin');

  @override
  Future<void> handleLogin(AuthCredential credential) {
    return _$handleLoginAsyncAction.run(() => super.handleLogin(credential));
  }

  final _$_AuthStoreBaseActionController =
      ActionController(name: '_AuthStoreBase');

  @override
  void setErrorMessage(String errorMessage) {
    final _$actionInfo = _$_AuthStoreBaseActionController.startAction(
        name: '_AuthStoreBase.setErrorMessage');
    try {
      return super.setErrorMessage(errorMessage);
    } finally {
      _$_AuthStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAuth(UserLoginResponseDTO res) {
    final _$actionInfo = _$_AuthStoreBaseActionController.startAction(
        name: '_AuthStoreBase.setAuth');
    try {
      return super.setAuth(res);
    } finally {
      _$_AuthStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void cleanState() {
    final _$actionInfo = _$_AuthStoreBaseActionController.startAction(
        name: '_AuthStoreBase.cleanState');
    try {
      return super.cleanState();
    } finally {
      _$_AuthStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
user: ${user},
token: ${token},
expiredAt: ${expiredAt},
verificationId: ${verificationId},
isLoading: ${isLoading},
isLoadingSentCode: ${isLoadingSentCode},
isLoggedIn: ${isLoggedIn},
errorMessage: ${errorMessage},
isSuccess: ${isSuccess},
canLogin: ${canLogin}
    ''';
  }
}
