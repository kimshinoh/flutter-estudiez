// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthStore on _AuthStoreBase, Store {
  Computed<String>? _$userIdComputed;

  @override
  String get userId => (_$userIdComputed ??=
          Computed<String>(() => super.userId, name: '_AuthStoreBase.userId'))
      .value;
  Computed<bool>? _$canLoginComputed;

  @override
  bool get canLogin => (_$canLoginComputed ??=
          Computed<bool>(() => super.canLogin, name: '_AuthStoreBase.canLogin'))
      .value;

  late final _$userAtom = Atom(name: '_AuthStoreBase.user', context: context);

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

  late final _$tokenAtom = Atom(name: '_AuthStoreBase.token', context: context);

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

  late final _$expiredAtAtom =
      Atom(name: '_AuthStoreBase.expiredAt', context: context);

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

  late final _$verificationIdAtom =
      Atom(name: '_AuthStoreBase.verificationId', context: context);

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

  late final _$isLoadingAtom =
      Atom(name: '_AuthStoreBase.isLoading', context: context);

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

  late final _$isLoadingSentCodeAtom =
      Atom(name: '_AuthStoreBase.isLoadingSentCode', context: context);

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

  late final _$isLoggedInAtom =
      Atom(name: '_AuthStoreBase.isLoggedIn', context: context);

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

  late final _$errorMessageAtom =
      Atom(name: '_AuthStoreBase.errorMessage', context: context);

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

  late final _$isSuccessAtom =
      Atom(name: '_AuthStoreBase.isSuccess', context: context);

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

  late final _$setUserAsyncAction =
      AsyncAction('_AuthStoreBase.setUser', context: context);

  @override
  Future setUser(UserModel.User user) {
    return _$setUserAsyncAction.run(() => super.setUser(user));
  }

  late final _$handleRequestOTPAsyncAction =
      AsyncAction('_AuthStoreBase.handleRequestOTP', context: context);

  @override
  Future<void> handleRequestOTP() {
    return _$handleRequestOTPAsyncAction.run(() => super.handleRequestOTP());
  }

  late final _$handleVerifyOTPAsyncAction =
      AsyncAction('_AuthStoreBase.handleVerifyOTP', context: context);

  @override
  Future<void> handleVerifyOTP() {
    return _$handleVerifyOTPAsyncAction.run(() => super.handleVerifyOTP());
  }

  late final _$handleLoginAsyncAction =
      AsyncAction('_AuthStoreBase.handleLogin', context: context);

  @override
  Future<void> handleLogin(AuthCredential credential) {
    return _$handleLoginAsyncAction.run(() => super.handleLogin(credential));
  }

  late final _$_AuthStoreBaseActionController =
      ActionController(name: '_AuthStoreBase', context: context);

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
userId: ${userId},
canLogin: ${canLogin}
    ''';
  }
}
