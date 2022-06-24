// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_update_profile_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FormUpdateProfileStore on _FormUpdateProfileStoreBase, Store {
  Computed<bool>? _$isValidComputed;

  @override
  bool get isValid => (_$isValidComputed ??= Computed<bool>(() => super.isValid,
          name: '_FormUpdateProfileStoreBase.isValid'))
      .value;

  late final _$errorMessageAtom =
      Atom(name: '_FormUpdateProfileStoreBase.errorMessage', context: context);

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

  late final _$isLoadingAtom =
      Atom(name: '_FormUpdateProfileStoreBase.isLoading', context: context);

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

  late final _$isLoadingAvatarAtom = Atom(
      name: '_FormUpdateProfileStoreBase.isLoadingAvatar', context: context);

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

  late final _$fullNameAtom =
      Atom(name: '_FormUpdateProfileStoreBase.fullName', context: context);

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

  late final _$avatarAtom =
      Atom(name: '_FormUpdateProfileStoreBase.avatar', context: context);

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

  late final _$emailAtom =
      Atom(name: '_FormUpdateProfileStoreBase.email', context: context);

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

  late final _$uploadAvatarAsyncAction =
      AsyncAction('_FormUpdateProfileStoreBase.uploadAvatar', context: context);

  @override
  Future<void> uploadAvatar(String filePath) {
    return _$uploadAvatarAsyncAction.run(() => super.uploadAvatar(filePath));
  }

  late final _$_FormUpdateProfileStoreBaseActionController =
      ActionController(name: '_FormUpdateProfileStoreBase', context: context);

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
email: ${email},
isValid: ${isValid}
    ''';
  }
}

mixin _$FormUpdateUserProfileValidation
    on _FormUpdateUserProfileValidationBase, Store {
  late final _$fullNameErrorAtom = Atom(
      name: '_FormUpdateUserProfileValidationBase.fullNameError',
      context: context);

  @override
  String? get fullNameError {
    _$fullNameErrorAtom.reportRead();
    return super.fullNameError;
  }

  @override
  set fullNameError(String? value) {
    _$fullNameErrorAtom.reportWrite(value, super.fullNameError, () {
      super.fullNameError = value;
    });
  }

  late final _$_FormUpdateUserProfileValidationBaseActionController =
      ActionController(
          name: '_FormUpdateUserProfileValidationBase', context: context);

  @override
  dynamic setFullNameError(String? fullNameError) {
    final _$actionInfo =
        _$_FormUpdateUserProfileValidationBaseActionController.startAction(
            name: '_FormUpdateUserProfileValidationBase.setFullNameError');
    try {
      return super.setFullNameError(fullNameError);
    } finally {
      _$_FormUpdateUserProfileValidationBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
fullNameError: ${fullNameError}
    ''';
  }
}
