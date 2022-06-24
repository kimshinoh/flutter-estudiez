// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_product_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SearchProductStore on _SearchProductStoreBase, Store {
  Computed<List<Product>>? _$productsComputed;

  @override
  List<Product> get products =>
      (_$productsComputed ??= Computed<List<Product>>(() => super.products,
              name: '_SearchProductStoreBase.products'))
          .value;

  late final _$productsByIdsAtom =
      Atom(name: '_SearchProductStoreBase.productsByIds', context: context);

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

  late final _$loadingAtom =
      Atom(name: '_SearchProductStoreBase.loading', context: context);

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
      Atom(name: '_SearchProductStoreBase.errorMessage', context: context);

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

  late final _$searchTypeAtom =
      Atom(name: '_SearchProductStoreBase.searchType', context: context);

  @override
  int get searchType {
    _$searchTypeAtom.reportRead();
    return super.searchType;
  }

  @override
  set searchType(int value) {
    _$searchTypeAtom.reportWrite(value, super.searchType, () {
      super.searchType = value;
    });
  }

  late final _$getProductsByIdsAsyncAction =
      AsyncAction('_SearchProductStoreBase.getProductsByIds', context: context);

  @override
  Future<void> getProductsByIds(List<String> ids) {
    return _$getProductsByIdsAsyncAction.run(() => super.getProductsByIds(ids));
  }

  late final _$_SearchProductStoreBaseActionController =
      ActionController(name: '_SearchProductStoreBase', context: context);

  @override
  void dispose() {
    final _$actionInfo = _$_SearchProductStoreBaseActionController.startAction(
        name: '_SearchProductStoreBase.dispose');
    try {
      return super.dispose();
    } finally {
      _$_SearchProductStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
productsByIds: ${productsByIds},
loading: ${loading},
errorMessage: ${errorMessage},
searchType: ${searchType},
products: ${products}
    ''';
  }
}
