// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_create_user_address_store.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Address _$AddressFromJson(Map<String, dynamic> json) => Address(
      address: json['address'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
    );

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'address': instance.address,
    };

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FormCreateUserAddressStore on _FormCreateUserAddressStoreBase, Store {
  Computed<bool>? _$isValidComputed;

  @override
  bool get isValid => (_$isValidComputed ??= Computed<bool>(() => super.isValid,
          name: '_FormCreateUserAddressStoreBase.isValid'))
      .value;

  final _$isLoadingAtom =
      Atom(name: '_FormCreateUserAddressStoreBase.isLoading');

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

  final _$errorMessageAtom =
      Atom(name: '_FormCreateUserAddressStoreBase.errorMessage');

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

  final _$fullNameAtom = Atom(name: '_FormCreateUserAddressStoreBase.fullName');

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

  final _$phoneNumberAtom =
      Atom(name: '_FormCreateUserAddressStoreBase.phoneNumber');

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

  final _$noteAtom = Atom(name: '_FormCreateUserAddressStoreBase.note');

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

  final _$addressAtom = Atom(name: '_FormCreateUserAddressStoreBase.address');

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

  final _$isDefaultAtom =
      Atom(name: '_FormCreateUserAddressStoreBase.isDefault');

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

  final _$saveUserAddressAsyncAction =
      AsyncAction('_FormCreateUserAddressStoreBase.saveUserAddress');

  @override
  Future<void> saveUserAddress() {
    return _$saveUserAddressAsyncAction.run(() => super.saveUserAddress());
  }

  final _$_FormCreateUserAddressStoreBaseActionController =
      ActionController(name: '_FormCreateUserAddressStoreBase');

  @override
  void setFullName(String fullName) {
    final _$actionInfo = _$_FormCreateUserAddressStoreBaseActionController
        .startAction(name: '_FormCreateUserAddressStoreBase.setFullName');
    try {
      return super.setFullName(fullName);
    } finally {
      _$_FormCreateUserAddressStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPhoneNumber(String phoneNumber) {
    final _$actionInfo = _$_FormCreateUserAddressStoreBaseActionController
        .startAction(name: '_FormCreateUserAddressStoreBase.setPhoneNumber');
    try {
      return super.setPhoneNumber(phoneNumber);
    } finally {
      _$_FormCreateUserAddressStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setNote(String note) {
    final _$actionInfo = _$_FormCreateUserAddressStoreBaseActionController
        .startAction(name: '_FormCreateUserAddressStoreBase.setNote');
    try {
      return super.setNote(note);
    } finally {
      _$_FormCreateUserAddressStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIsDefault() {
    final _$actionInfo = _$_FormCreateUserAddressStoreBaseActionController
        .startAction(name: '_FormCreateUserAddressStoreBase.setIsDefault');
    try {
      return super.setIsDefault();
    } finally {
      _$_FormCreateUserAddressStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
errorMessage: ${errorMessage},
fullName: ${fullName},
phoneNumber: ${phoneNumber},
note: ${note},
address: ${address},
isDefault: ${isDefault},
isValid: ${isValid}
    ''';
  }
}

mixin _$FormCreateUserAddressValidation
    on FormCreateUserAddressValidationBase, Store {
  Computed<bool>? _$isValidComputed;

  @override
  bool get isValid => (_$isValidComputed ??= Computed<bool>(() => super.isValid,
          name: 'FormCreateUserAddressValidationBase.isValid'))
      .value;

  final _$fullNameErrorAtom =
      Atom(name: 'FormCreateUserAddressValidationBase.fullNameError');

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

  final _$phoneNumberErrorAtom =
      Atom(name: 'FormCreateUserAddressValidationBase.phoneNumberError');

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

  final _$FormCreateUserAddressValidationBaseActionController =
      ActionController(name: 'FormCreateUserAddressValidationBase');

  @override
  dynamic setFullNameError(String? fullNameError) {
    final _$actionInfo =
        _$FormCreateUserAddressValidationBaseActionController.startAction(
            name: 'FormCreateUserAddressValidationBase.setFullNameError');
    try {
      return super.setFullNameError(fullNameError);
    } finally {
      _$FormCreateUserAddressValidationBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPhoneNumberError(String? phoneNumberError) {
    final _$actionInfo =
        _$FormCreateUserAddressValidationBaseActionController.startAction(
            name: 'FormCreateUserAddressValidationBase.setPhoneNumberError');
    try {
      return super.setPhoneNumberError(phoneNumberError);
    } finally {
      _$FormCreateUserAddressValidationBaseActionController
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
