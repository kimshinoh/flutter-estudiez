// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_update_user_address_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FormUpdateUserAddressStore on _FormUpdateUserAddressStoreBase, Store {
  Computed<bool>? _$isValidComputed;

  @override
  bool get isValid => (_$isValidComputed ??= Computed<bool>(() => super.isValid,
          name: '_FormUpdateUserAddressStoreBase.isValid'))
      .value;

  late final _$isLoadingAtom =
      Atom(name: '_FormUpdateUserAddressStoreBase.isLoading', context: context);

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

  late final _$errorMessageAtom = Atom(
      name: '_FormUpdateUserAddressStoreBase.errorMessage', context: context);

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

  late final _$idAtom =
      Atom(name: '_FormUpdateUserAddressStoreBase.id', context: context);

  @override
  String get id {
    _$idAtom.reportRead();
    return super.id;
  }

  @override
  set id(String value) {
    _$idAtom.reportWrite(value, super.id, () {
      super.id = value;
    });
  }

  late final _$fullNameAtom =
      Atom(name: '_FormUpdateUserAddressStoreBase.fullName', context: context);

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

  late final _$phoneNumberAtom = Atom(
      name: '_FormUpdateUserAddressStoreBase.phoneNumber', context: context);

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

  late final _$noteAtom =
      Atom(name: '_FormUpdateUserAddressStoreBase.note', context: context);

  @override
  String get note {
    _$noteAtom.reportRead();
    return super.note;
  }

  @override
  set note(String value) {
    _$noteAtom.reportWrite(value, super.note, () {
      super.note = value;
    });
  }

  late final _$addressAtom =
      Atom(name: '_FormUpdateUserAddressStoreBase.address', context: context);

  @override
  Address get address {
    _$addressAtom.reportRead();
    return super.address;
  }

  @override
  set address(Address value) {
    _$addressAtom.reportWrite(value, super.address, () {
      super.address = value;
    });
  }

  late final _$isDefaultAtom =
      Atom(name: '_FormUpdateUserAddressStoreBase.isDefault', context: context);

  @override
  bool get isDefault {
    _$isDefaultAtom.reportRead();
    return super.isDefault;
  }

  @override
  set isDefault(bool value) {
    _$isDefaultAtom.reportWrite(value, super.isDefault, () {
      super.isDefault = value;
    });
  }

  late final _$getUserAddressAsyncAction = AsyncAction(
      '_FormUpdateUserAddressStoreBase.getUserAddress',
      context: context);

  @override
  Future<void> getUserAddress() {
    return _$getUserAddressAsyncAction.run(() => super.getUserAddress());
  }

  late final _$updateUserAddressAsyncAction = AsyncAction(
      '_FormUpdateUserAddressStoreBase.updateUserAddress',
      context: context);

  @override
  Future<void> updateUserAddress(String userId) {
    return _$updateUserAddressAsyncAction
        .run(() => super.updateUserAddress(userId));
  }

  late final _$removeUserAddressAsyncAction = AsyncAction(
      '_FormUpdateUserAddressStoreBase.removeUserAddress',
      context: context);

  @override
  Future<void> removeUserAddress(String userId) {
    return _$removeUserAddressAsyncAction
        .run(() => super.removeUserAddress(userId));
  }

  late final _$_FormUpdateUserAddressStoreBaseActionController =
      ActionController(
          name: '_FormUpdateUserAddressStoreBase', context: context);

  @override
  void setFullName(String fullName) {
    final _$actionInfo = _$_FormUpdateUserAddressStoreBaseActionController
        .startAction(name: '_FormUpdateUserAddressStoreBase.setFullName');
    try {
      return super.setFullName(fullName);
    } finally {
      _$_FormUpdateUserAddressStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPhoneNumber(String phoneNumber) {
    final _$actionInfo = _$_FormUpdateUserAddressStoreBaseActionController
        .startAction(name: '_FormUpdateUserAddressStoreBase.setPhoneNumber');
    try {
      return super.setPhoneNumber(phoneNumber);
    } finally {
      _$_FormUpdateUserAddressStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setNote(String note) {
    final _$actionInfo = _$_FormUpdateUserAddressStoreBaseActionController
        .startAction(name: '_FormUpdateUserAddressStoreBase.setNote');
    try {
      return super.setNote(note);
    } finally {
      _$_FormUpdateUserAddressStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIsDefault() {
    final _$actionInfo = _$_FormUpdateUserAddressStoreBaseActionController
        .startAction(name: '_FormUpdateUserAddressStoreBase.setIsDefault');
    try {
      return super.setIsDefault();
    } finally {
      _$_FormUpdateUserAddressStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
errorMessage: ${errorMessage},
id: ${id},
fullName: ${fullName},
phoneNumber: ${phoneNumber},
note: ${note},
address: ${address},
isDefault: ${isDefault},
isValid: ${isValid}
    ''';
  }
}

mixin _$FormUpdateUserAddressValidation
    on FormUpdateUserAddressValidationBase, Store {
  Computed<bool>? _$isValidComputed;

  @override
  bool get isValid => (_$isValidComputed ??= Computed<bool>(() => super.isValid,
          name: 'FormUpdateUserAddressValidationBase.isValid'))
      .value;

  late final _$fullNameErrorAtom = Atom(
      name: 'FormUpdateUserAddressValidationBase.fullNameError',
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

  late final _$phoneNumberErrorAtom = Atom(
      name: 'FormUpdateUserAddressValidationBase.phoneNumberError',
      context: context);

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

  late final _$FormUpdateUserAddressValidationBaseActionController =
      ActionController(
          name: 'FormUpdateUserAddressValidationBase', context: context);

  @override
  dynamic setFullNameError(String? fullNameError) {
    final _$actionInfo =
        _$FormUpdateUserAddressValidationBaseActionController.startAction(
            name: 'FormUpdateUserAddressValidationBase.setFullNameError');
    try {
      return super.setFullNameError(fullNameError);
    } finally {
      _$FormUpdateUserAddressValidationBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPhoneNumberError(String? phoneNumberError) {
    final _$actionInfo =
        _$FormUpdateUserAddressValidationBaseActionController.startAction(
            name: 'FormUpdateUserAddressValidationBase.setPhoneNumberError');
    try {
      return super.setPhoneNumberError(phoneNumberError);
    } finally {
      _$FormUpdateUserAddressValidationBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
fullNameError: ${fullNameError},
phoneNumberError: ${phoneNumberError},
isValid: ${isValid}
    ''';
  }
}
