// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seller_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SellerStore on _SellerStoreBase, Store {
  Computed<Map<String, Seller>>? _$sellersMapComputed;

  @override
  Map<String, Seller> get sellersMap =>
      (_$sellersMapComputed ??= Computed<Map<String, Seller>>(
        () => super.sellersMap,
        name: '_SellerStoreBase.sellersMap',
      ))
          .value;

  final Atom _$sellersAtom = Atom(name: '_SellerStoreBase.sellers');

  @override
  List<Seller> get sellers {
    _$sellersAtom.reportRead();
    return super.sellers;
  }

  @override
  set sellers(List<Seller> value) {
    _$sellersAtom.reportWrite(value, super.sellers, () {
      super.sellers = value;
    });
  }

  final Atom _$loadingAtom = Atom(name: '_SellerStoreBase.loading');

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

  final Atom _$errorAtom = Atom(name: '_SellerStoreBase.error');

  @override
  String get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(String value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  final AsyncAction _$getSellersAsyncAction =
      AsyncAction('_SellerStoreBase.getSellers');

  @override
  Future<void> getSellers(List<String> ids) {
    return _$getSellersAsyncAction.run(() => super.getSellers(ids));
  }

  @override
  String toString() {
    return '''
sellers: ${sellers},
loading: ${loading},
error: ${error},
sellersMap: ${sellersMap}
    ''';
  }
}
