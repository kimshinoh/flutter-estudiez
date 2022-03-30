// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$User on _UserBase, Store {
  final _$phoneNumberAtom = Atom(name: '_UserBase.phoneNumber');

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

  final _$idTokenAtom = Atom(name: '_UserBase.idToken');

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

  final _$_UserBaseActionController = ActionController(name: '_UserBase');

  @override
  void setPhoneNumber(String phoneNumber) {
    final _$actionInfo = _$_UserBaseActionController.startAction(
        name: '_UserBase.setPhoneNumber');
    try {
      return super.setPhoneNumber(phoneNumber);
    } finally {
      _$_UserBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIdToken(String idToken) {
    final _$actionInfo =
        _$_UserBaseActionController.startAction(name: '_UserBase.setIdToken');
    try {
      return super.setIdToken(idToken);
    } finally {
      _$_UserBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
phoneNumber: ${phoneNumber},
idToken: ${idToken}
    ''';
  }
}
