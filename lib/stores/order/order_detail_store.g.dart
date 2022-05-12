// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_detail_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$OrderDetailStore on _OrderDetailStoreBase, Store {
  late final _$orderAtom =
      Atom(name: '_OrderDetailStoreBase.order', context: context);

  @override
  Order? get order {
    _$orderAtom.reportRead();
    return super.order;
  }

  @override
  set order(Order? value) {
    _$orderAtom.reportWrite(value, super.order, () {
      super.order = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_OrderDetailStoreBase.isLoading', context: context);

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

  late final _$errorAtom =
      Atom(name: '_OrderDetailStoreBase.error', context: context);

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

  late final _$getOrderDetailAsyncAction =
      AsyncAction('_OrderDetailStoreBase.getOrderDetail', context: context);

  @override
  Future<void> getOrderDetail(String orderId) {
    return _$getOrderDetailAsyncAction.run(() => super.getOrderDetail(orderId));
  }

  @override
  String toString() {
    return '''
order: ${order},
isLoading: ${isLoading},
error: ${error}
    ''';
  }
}
