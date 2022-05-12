// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_product_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$StockProductStore on _StockProductStoreBase, Store {
  final _$isLoadingAtom = Atom(name: '_StockProductStoreBase.isLoading');

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

  final _$stockAtom = Atom(name: '_StockProductStoreBase.stock');

  @override
  Stock? get stock {
    _$stockAtom.reportRead();
    return super.stock;
  }

  @override
  set stock(Stock? value) {
    _$stockAtom.reportWrite(value, super.stock, () {
      super.stock = value;
    });
  }

  final _$getStockByProductIdAsyncAction =
      AsyncAction('_StockProductStoreBase.getStockByProductId');

  @override
  Future<void> getStockByProductId(String id) {
    return _$getStockByProductIdAsyncAction
        .run(() => super.getStockByProductId(id));
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
stock: ${stock}
    ''';
  }
}
