// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_address_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserAddressStore on _UserAddressStoreBase, Store {
  Computed<UserAddress?>? _$defaultAddressComputed;

  @override
  UserAddress? get defaultAddress => (_$defaultAddressComputed ??=
          Computed<UserAddress?>(() => super.defaultAddress,
              name: '_UserAddressStoreBase.defaultAddress'))
      .value;
  Computed<List<UserAddress>>? _$nonDefaultAddressesComputed;

  @override
  List<UserAddress> get nonDefaultAddresses =>
      (_$nonDefaultAddressesComputed ??= Computed<List<UserAddress>>(
              () => super.nonDefaultAddresses,
              name: '_UserAddressStoreBase.nonDefaultAddresses'))
          .value;
  Computed<bool>? _$hasNonDefaultAddressComputed;

  @override
  bool get hasNonDefaultAddress => (_$hasNonDefaultAddressComputed ??=
          Computed<bool>(() => super.hasNonDefaultAddress,
              name: '_UserAddressStoreBase.hasNonDefaultAddress'))
      .value;

  final _$userAddressesAtom = Atom(name: '_UserAddressStoreBase.userAddresses');

  @override
  List<UserAddress> get userAddresses {
    _$userAddressesAtom.reportRead();
    return super.userAddresses;
  }

  @override
  set userAddresses(List<UserAddress> value) {
    _$userAddressesAtom.reportWrite(value, super.userAddresses, () {
      super.userAddresses = value;
    });
  }

  final _$errorAtom = Atom(name: '_UserAddressStoreBase.error');

  @override
  String? get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(String? value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  final _$loadingAtom = Atom(name: '_UserAddressStoreBase.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$getUserAddressesAsyncAction =
      AsyncAction('_UserAddressStoreBase.getUserAddresses');

  @override
  Future<void> getUserAddresses() {
    return _$getUserAddressesAsyncAction.run(() => super.getUserAddresses());
  }

  final _$_UserAddressStoreBaseActionController =
      ActionController(name: '_UserAddressStoreBase');

  @override
  void clearUserAddresses() {
    final _$actionInfo = _$_UserAddressStoreBaseActionController.startAction(
        name: '_UserAddressStoreBase.clearUserAddresses');
    try {
      return super.clearUserAddresses();
    } finally {
      _$_UserAddressStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
userAddresses: ${userAddresses},
error: ${error},
loading: ${loading},
defaultAddress: ${defaultAddress},
nonDefaultAddresses: ${nonDefaultAddresses},
hasNonDefaultAddress: ${hasNonDefaultAddress}
    ''';
  }
}
