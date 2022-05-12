// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_detail_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProductDetailStore on _ProductDetailStoreBase, Store {
  late final _$isLoadingAtom =
      Atom(name: '_ProductDetailStoreBase.isLoading', context: context);

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

  late final _$errorMessageAtom =
      Atom(name: '_ProductDetailStoreBase.errorMessage', context: context);

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

  late final _$productAtom =
      Atom(name: '_ProductDetailStoreBase.product', context: context);

  @override
  Product? get product {
    _$productAtom.reportRead();
    return super.product;
  }

  @override
  set product(Product? value) {
    _$productAtom.reportWrite(value, super.product, () {
      super.product = value;
    });
  }

  late final _$relateProductsAtom =
      Atom(name: '_ProductDetailStoreBase.relateProducts', context: context);

  @override
  List<Product> get relateProducts {
    _$relateProductsAtom.reportRead();
    return super.relateProducts;
  }

  @override
  set relateProducts(List<Product> value) {
    _$relateProductsAtom.reportWrite(value, super.relateProducts, () {
      super.relateProducts = value;
    });
  }

  late final _$getProductDetailAsyncAction =
      AsyncAction('_ProductDetailStoreBase.getProductDetail', context: context);

  @override
  Future<void> getProductDetail(String productId) {
    return _$getProductDetailAsyncAction
        .run(() => super.getProductDetail(productId));
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
errorMessage: ${errorMessage},
product: ${product},
relateProducts: ${relateProducts}
    ''';
  }
}
