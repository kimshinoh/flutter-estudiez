// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_update_profile_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FormUpdateProfileStore on _FormUpdateProfileStoreBase, Store {
  final _$errorMessageAtom =
      Atom(name: '_FormUpdateProfileStoreBase.errorMessage');

  @override
  String? get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String? value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_FormUpdateProfileStoreBase.isLoading');

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

  final _$isLoadingAvatarAtom =
      Atom(name: '_FormUpdateProfileStoreBase.isLoadingAvatar');

  @override
  bool get isLoadingAvatar {
    _$isLoadingAvatarAtom.reportRead();
    return super.isLoadingAvatar;
  }

  @override
  set isLoadingAvatar(bool value) {
    _$isLoadingAvatarAtom.reportWrite(value, super.isLoadingAvatar, () {
      super.isLoadingAvatar = value;
    });
  }

  final _$fullNameAtom = Atom(name: '_FormUpdateProfileStoreBase.fullName');

  @override
  String get fullName {
    _$fullNameAtom.reportRead();
    return super.fullName;
  }

  @override
  set fullName(String value) {
    _$fullNameAtom.reportWrite(value, super.fullName, () {
      super.fullName = value;
    });
  }

  final _$avatarAtom = Atom(name: '_FormUpdateProfileStoreBase.avatar');

  @override
  String get avatar {
    _$avatarAtom.reportRead();
    return super.avatar;
  }

  @override
  set avatar(String value) {
    _$avatarAtom.reportWrite(value, super.avatar, () {
      super.avatar = value;
    });
  }

  final _$emailAtom = Atom(name: '_FormUpdateProfileStoreBase.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$uploadAvatarAsyncAction =
      AsyncAction('_FormUpdateProfileStoreBase.uploadAvatar');

  @override
  Future<void> uploadAvatar(String filePath) {
    return _$uploadAvatarAsyncAction.run(() => super.uploadAvatar(filePath));
  }

  final _$_FormUpdateProfileStoreBaseActionController =
      ActionController(name: '_FormUpdateProfileStoreBase');

  @override
  void setFullName(String fullName) {
    final _$actionInfo = _$_FormUpdateProfileStoreBaseActionController
        .startAction(name: '_FormUpdateProfileStoreBase.setFullName');
    try {
      return super.setFullName(fullName);
    } finally {
      _$_FormUpdateProfileStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAvatar(String avatar) {
    final _$actionInfo = _$_FormUpdateProfileStoreBaseActionController
        .startAction(name: '_FormUpdateProfileStoreBase.setAvatar');
    try {
      return super.setAvatar(avatar);
    } finally {
      _$_FormUpdateProfileStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(String email) {
    final _$actionInfo = _$_FormUpdateProfileStoreBaseActionController
        .startAction(name: '_FormUpdateProfileStoreBase.setEmail');
    try {
      return super.setEmail(email);
    } finally {
      _$_FormUpdateProfileStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
errorMessage: ${errorMessage},
isLoading: ${isLoading},
isLoadingAvatar: ${isLoadingAvatar},
fullName: ${fullName},
avatar: ${avatar},
email: ${email}
    ''';
  }
}
