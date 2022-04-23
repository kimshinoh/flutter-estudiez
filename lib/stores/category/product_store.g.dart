// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProductStore on _ProductStoreBase, Store {
  final _$productsAtom = Atom(name: '_ProductStoreBase.products');

  @override
  List<Product> get products {
    _$productsAtom.reportRead();
    return super.products;
  }

  @override
  set products(List<Product> value) {
    _$productsAtom.reportWrite(value, super.products, () {
      super.products = value;
    });
  }

  final _$productsTopSaleAtom = Atom(name: '_ProductStoreBase.productsTopSale');

  @override
  List<Product> get productsTopSale {
    _$productsTopSaleAtom.reportRead();
    return super.productsTopSale;
  }

  @override
  set productsTopSale(List<Product> value) {
    _$productsTopSaleAtom.reportWrite(value, super.productsTopSale, () {
      super.productsTopSale = value;
    });
  }

  final _$productsSaleOffAtom = Atom(name: '_ProductStoreBase.productsSaleOff');

  @override
  List<Product> get productsSaleOff {
    _$productsSaleOffAtom.reportRead();
    return super.productsSaleOff;
  }

  @override
  set productsSaleOff(List<Product> value) {
    _$productsSaleOffAtom.reportWrite(value, super.productsSaleOff, () {
      super.productsSaleOff = value;
    });
  }

  final _$productsSaleShockAtom =
      Atom(name: '_ProductStoreBase.productsSaleShock');

  @override
  List<Product> get productsSaleShock {
    _$productsSaleShockAtom.reportRead();
    return super.productsSaleShock;
  }

  @override
  set productsSaleShock(List<Product> value) {
    _$productsSaleShockAtom.reportWrite(value, super.productsSaleShock, () {
      super.productsSaleShock = value;
    });
  }

  final _$productsByIdsAtom = Atom(name: '_ProductStoreBase.productsByIds');

  @override
  List<Product> get productsByIds {
    _$productsByIdsAtom.reportRead();
    return super.productsByIds;
  }

  @override
  set productsByIds(List<Product> value) {
    _$productsByIdsAtom.reportWrite(value, super.productsByIds, () {
      super.productsByIds = value;
    });
  }

  final _$loadingAtom = Atom(name: '_ProductStoreBase.loading');

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

  final _$errorMessageAtom = Atom(name: '_ProductStoreBase.errorMessage');

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

  final _$getProductsByIdsAsyncAction =
      AsyncAction('_ProductStoreBase.getProductsByIds');

  @override
  Future<void> getProductsByIds(List<String> ids) {
    return _$getProductsByIdsAsyncAction.run(() => super.getProductsByIds(ids));
  }

  final _$getProductsTopSaleAsyncAction =
      AsyncAction('_ProductStoreBase.getProductsTopSale');

  @override
  Future<void> getProductsTopSale(int limit) {
    return _$getProductsTopSaleAsyncAction
        .run(() => super.getProductsTopSale(limit));
  }

  final _$getProductsSaleShockAsyncAction =
      AsyncAction('_ProductStoreBase.getProductsSaleShock');

  @override
  Future<void> getProductsSaleShock(int limit) {
    return _$getProductsSaleShockAsyncAction
        .run(() => super.getProductsSaleShock(limit));
  }

  final _$getProductsSaleOffAsyncAction =
      AsyncAction('_ProductStoreBase.getProductsSaleOff');

  @override
  Future<void> getProductsSaleOff(int limit) {
    return _$getProductsSaleOffAsyncAction
        .run(() => super.getProductsSaleOff(limit));
  }

  final _$getProductsAsyncAction = AsyncAction('_ProductStoreBase.getProducts');

  @override
  Future<void> getProducts(String categoryId) {
    return _$getProductsAsyncAction.run(() => super.getProducts(categoryId));
  }

  final _$_ProductStoreBaseActionController =
      ActionController(name: '_ProductStoreBase');

  @override
  void dispose() {
    final _$actionInfo = _$_ProductStoreBaseActionController.startAction(
        name: '_ProductStoreBase.dispose');
    try {
      return super.dispose();
    } finally {
      _$_ProductStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
products: ${products},
productsTopSale: ${productsTopSale},
productsSaleOff: ${productsSaleOff},
productsSaleShock: ${productsSaleShock},
productsByIds: ${productsByIds},
loading: ${loading},
errorMessage: ${errorMessage}
    ''';
  }
}
