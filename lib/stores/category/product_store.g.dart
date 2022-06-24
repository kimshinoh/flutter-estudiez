// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProductStore on _ProductStoreBase, Store {
  Computed<List<Product>>? _$sortedProductsComputed;

  @override
  List<Product> get sortedProducts => (_$sortedProductsComputed ??=
          Computed<List<Product>>(() => super.sortedProducts,
              name: '_ProductStoreBase.sortedProducts'))
      .value;

  late final _$sortProductAtom =
      Atom(name: '_ProductStoreBase.sortProduct', context: context);

  @override
  SortProduct get sortProduct {
    _$sortProductAtom.reportRead();
    return super.sortProduct;
  }

  @override
  set sortProduct(SortProduct value) {
    _$sortProductAtom.reportWrite(value, super.sortProduct, () {
      super.sortProduct = value;
    });
  }

  late final _$productsAtom =
      Atom(name: '_ProductStoreBase.products', context: context);

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

  late final _$productsTopSaleAtom =
      Atom(name: '_ProductStoreBase.productsTopSale', context: context);

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

  late final _$productsSaleOffAtom =
      Atom(name: '_ProductStoreBase.productsSaleOff', context: context);

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

  late final _$productsSaleShockAtom =
      Atom(name: '_ProductStoreBase.productsSaleShock', context: context);

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

  late final _$productsTopSaleBigAtom =
      Atom(name: '_ProductStoreBase.productsTopSaleBig', context: context);

  @override
  List<Product> get productsTopSaleBig {
    _$productsTopSaleBigAtom.reportRead();
    return super.productsTopSaleBig;
  }

  @override
  set productsTopSaleBig(List<Product> value) {
    _$productsTopSaleBigAtom.reportWrite(value, super.productsTopSaleBig, () {
      super.productsTopSaleBig = value;
    });
  }

  late final _$productsSaleOffBigAtom =
      Atom(name: '_ProductStoreBase.productsSaleOffBig', context: context);

  @override
  List<Product> get productsSaleOffBig {
    _$productsSaleOffBigAtom.reportRead();
    return super.productsSaleOffBig;
  }

  @override
  set productsSaleOffBig(List<Product> value) {
    _$productsSaleOffBigAtom.reportWrite(value, super.productsSaleOffBig, () {
      super.productsSaleOffBig = value;
    });
  }

  late final _$productsSaleShockBigAtom =
      Atom(name: '_ProductStoreBase.productsSaleShockBig', context: context);

  @override
  List<Product> get productsSaleShockBig {
    _$productsSaleShockBigAtom.reportRead();
    return super.productsSaleShockBig;
  }

  @override
  set productsSaleShockBig(List<Product> value) {
    _$productsSaleShockBigAtom.reportWrite(value, super.productsSaleShockBig,
        () {
      super.productsSaleShockBig = value;
    });
  }

  late final _$loadingAtom =
      Atom(name: '_ProductStoreBase.loading', context: context);

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

  late final _$errorMessageAtom =
      Atom(name: '_ProductStoreBase.errorMessage', context: context);

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

  late final _$getProductsTopSaleAsyncAction =
      AsyncAction('_ProductStoreBase.getProductsTopSale', context: context);

  @override
  Future<void> getProductsTopSale(int limit) {
    return _$getProductsTopSaleAsyncAction
        .run(() => super.getProductsTopSale(limit));
  }

  late final _$getProductsSaleShockAsyncAction =
      AsyncAction('_ProductStoreBase.getProductsSaleShock', context: context);

  @override
  Future<void> getProductsSaleShock(int limit) {
    return _$getProductsSaleShockAsyncAction
        .run(() => super.getProductsSaleShock(limit));
  }

  late final _$getProductsSaleOffAsyncAction =
      AsyncAction('_ProductStoreBase.getProductsSaleOff', context: context);

  @override
  Future<void> getProductsSaleOff(int limit) {
    return _$getProductsSaleOffAsyncAction
        .run(() => super.getProductsSaleOff(limit));
  }

  late final _$getProductsAsyncAction =
      AsyncAction('_ProductStoreBase.getProducts', context: context);

  @override
  Future<void> getProducts(String categoryId) {
    return _$getProductsAsyncAction.run(() => super.getProducts(categoryId));
  }

  late final _$_ProductStoreBaseActionController =
      ActionController(name: '_ProductStoreBase', context: context);

  @override
  void setSortProduct(SortProduct sortProduct) {
    final _$actionInfo = _$_ProductStoreBaseActionController.startAction(
        name: '_ProductStoreBase.setSortProduct');
    try {
      return super.setSortProduct(sortProduct);
    } finally {
      _$_ProductStoreBaseActionController.endAction(_$actionInfo);
    }
  }

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
  void disposeBig() {
    final _$actionInfo = _$_ProductStoreBaseActionController.startAction(
        name: '_ProductStoreBase.disposeBig');
    try {
      return super.disposeBig();
    } finally {
      _$_ProductStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
sortProduct: ${sortProduct},
products: ${products},
productsTopSale: ${productsTopSale},
productsSaleOff: ${productsSaleOff},
productsSaleShock: ${productsSaleShock},
productsTopSaleBig: ${productsTopSaleBig},
productsSaleOffBig: ${productsSaleOffBig},
productsSaleShockBig: ${productsSaleShockBig},
loading: ${loading},
errorMessage: ${errorMessage},
sortedProducts: ${sortedProducts}
    ''';
  }
}
