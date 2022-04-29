// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orders_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$OrdersStore on _OrdersStoreBase, Store {
  Computed<List<Order>>? _$processingOrdersComputed;

  @override
  List<Order> get processingOrders => (_$processingOrdersComputed ??=
          Computed<List<Order>>(() => super.processingOrders,
              name: '_OrdersStoreBase.processingOrders'))
      .value;
  Computed<List<Order>>? _$completedOrdersComputed;

  @override
  List<Order> get completedOrders => (_$completedOrdersComputed ??=
          Computed<List<Order>>(() => super.completedOrders,
              name: '_OrdersStoreBase.completedOrders'))
      .value;

  final _$isLoadingAtom = Atom(name: '_OrdersStoreBase.isLoading');

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

  final _$errorMessageAtom = Atom(name: '_OrdersStoreBase.errorMessage');

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

  final _$ordersAtom = Atom(name: '_OrdersStoreBase.orders');

  @override
  List<Order> get orders {
    _$ordersAtom.reportRead();
    return super.orders;
  }

  @override
  set orders(List<Order> value) {
    _$ordersAtom.reportWrite(value, super.orders, () {
      super.orders = value;
    });
  }

  final _$getMyOrdersAsyncAction = AsyncAction('_OrdersStoreBase.getMyOrders');

  @override
  Future<void> getMyOrders(String status) {
    return _$getMyOrdersAsyncAction.run(() => super.getMyOrders(status));
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
errorMessage: ${errorMessage},
orders: ${orders},
processingOrders: ${processingOrders},
completedOrders: ${completedOrders}
    ''';
  }
}
