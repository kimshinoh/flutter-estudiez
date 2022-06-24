// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_order_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CreateOrderStore on _CreateOrderStoreBase, Store {
  Computed<double>? _$shippingFeeComputed;

  @override
  double get shippingFee =>
      (_$shippingFeeComputed ??= Computed<double>(() => super.shippingFee,
              name: '_CreateOrderStoreBase.shippingFee'))
          .value;
  Computed<double>? _$totalPriceComputed;

  @override
  double get totalPrice =>
      (_$totalPriceComputed ??= Computed<double>(() => super.totalPrice,
              name: '_CreateOrderStoreBase.totalPrice'))
          .value;
  Computed<double>? _$itemsPriceComputed;

  @override
  double get itemsPrice =>
      (_$itemsPriceComputed ??= Computed<double>(() => super.itemsPrice,
              name: '_CreateOrderStoreBase.itemsPrice'))
          .value;
  Computed<bool>? _$canCreateOrderComputed;

  @override
  bool get canCreateOrder =>
      (_$canCreateOrderComputed ??= Computed<bool>(() => super.canCreateOrder,
              name: '_CreateOrderStoreBase.canCreateOrder'))
          .value;

  late final _$isLoadingAtom =
      Atom(name: '_CreateOrderStoreBase.isLoading', context: context);

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
      Atom(name: '_CreateOrderStoreBase.errorMessage', context: context);

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

  late final _$receivedAtAtom =
      Atom(name: '_CreateOrderStoreBase.receivedAt', context: context);

  @override
  DateTime get receivedAt {
    _$receivedAtAtom.reportRead();
    return super.receivedAt;
  }

  @override
  set receivedAt(DateTime value) {
    _$receivedAtAtom.reportWrite(value, super.receivedAt, () {
      super.receivedAt = value;
    });
  }

  late final _$noteAtom =
      Atom(name: '_CreateOrderStoreBase.note', context: context);

  @override
  String get note {
    _$noteAtom.reportRead();
    return super.note;
  }

  @override
  set note(String value) {
    _$noteAtom.reportWrite(value, super.note, () {
      super.note = value;
    });
  }

  late final _$paymentAtom =
      Atom(name: '_CreateOrderStoreBase.payment', context: context);

  @override
  Payment? get payment {
    _$paymentAtom.reportRead();
    return super.payment;
  }

  @override
  set payment(Payment? value) {
    _$paymentAtom.reportWrite(value, super.payment, () {
      super.payment = value;
    });
  }

  late final _$sellerIdAtom =
      Atom(name: '_CreateOrderStoreBase.sellerId', context: context);

  @override
  String? get sellerId {
    _$sellerIdAtom.reportRead();
    return super.sellerId;
  }

  @override
  set sellerId(String? value) {
    _$sellerIdAtom.reportWrite(value, super.sellerId, () {
      super.sellerId = value;
    });
  }

  late final _$sellerAtom =
      Atom(name: '_CreateOrderStoreBase.seller', context: context);

  @override
  Seller? get seller {
    _$sellerAtom.reportRead();
    return super.seller;
  }

  @override
  set seller(Seller? value) {
    _$sellerAtom.reportWrite(value, super.seller, () {
      super.seller = value;
    });
  }

  late final _$itemsAtom =
      Atom(name: '_CreateOrderStoreBase.items', context: context);

  @override
  List<CartItem> get items {
    _$itemsAtom.reportRead();
    return super.items;
  }

  @override
  set items(List<CartItem> value) {
    _$itemsAtom.reportWrite(value, super.items, () {
      super.items = value;
    });
  }

  late final _$addressAtom =
      Atom(name: '_CreateOrderStoreBase.address', context: context);

  @override
  UserAddress? get address {
    _$addressAtom.reportRead();
    return super.address;
  }

  @override
  set address(UserAddress? value) {
    _$addressAtom.reportWrite(value, super.address, () {
      super.address = value;
    });
  }

  late final _$distanceAtom =
      Atom(name: '_CreateOrderStoreBase.distance', context: context);

  @override
  double get distance {
    _$distanceAtom.reportRead();
    return super.distance;
  }

  @override
  set distance(double value) {
    _$distanceAtom.reportWrite(value, super.distance, () {
      super.distance = value;
    });
  }

  late final _$calcDistanceAsyncAction =
      AsyncAction('_CreateOrderStoreBase.calcDistance', context: context);

  @override
  Future<void> calcDistance() {
    return _$calcDistanceAsyncAction.run(() => super.calcDistance());
  }

  late final _$createOrderAsyncAction =
      AsyncAction('_CreateOrderStoreBase.createOrder', context: context);

  @override
  Future<void> createOrder(UserAddress userAddress) {
    return _$createOrderAsyncAction.run(() => super.createOrder(userAddress));
  }

  late final _$_CreateOrderStoreBaseActionController =
      ActionController(name: '_CreateOrderStoreBase', context: context);

  @override
  void setItems(List<CartItem> items) {
    final _$actionInfo = _$_CreateOrderStoreBaseActionController.startAction(
        name: '_CreateOrderStoreBase.setItems');
    try {
      return super.setItems(items);
    } finally {
      _$_CreateOrderStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setReceivedAt(DateTime receivedAt) {
    final _$actionInfo = _$_CreateOrderStoreBaseActionController.startAction(
        name: '_CreateOrderStoreBase.setReceivedAt');
    try {
      return super.setReceivedAt(receivedAt);
    } finally {
      _$_CreateOrderStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setNote(String note) {
    final _$actionInfo = _$_CreateOrderStoreBaseActionController.startAction(
        name: '_CreateOrderStoreBase.setNote');
    try {
      return super.setNote(note);
    } finally {
      _$_CreateOrderStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPayment(Payment payment) {
    final _$actionInfo = _$_CreateOrderStoreBaseActionController.startAction(
        name: '_CreateOrderStoreBase.setPayment');
    try {
      return super.setPayment(payment);
    } finally {
      _$_CreateOrderStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSellerId(String sellerId) {
    final _$actionInfo = _$_CreateOrderStoreBaseActionController.startAction(
        name: '_CreateOrderStoreBase.setSellerId');
    try {
      return super.setSellerId(sellerId);
    } finally {
      _$_CreateOrderStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSeller(Seller seller) {
    final _$actionInfo = _$_CreateOrderStoreBaseActionController.startAction(
        name: '_CreateOrderStoreBase.setSeller');
    try {
      return super.setSeller(seller);
    } finally {
      _$_CreateOrderStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAddress(UserAddress? address) {
    final _$actionInfo = _$_CreateOrderStoreBaseActionController.startAction(
        name: '_CreateOrderStoreBase.setAddress');
    try {
      return super.setAddress(address);
    } finally {
      _$_CreateOrderStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clear() {
    final _$actionInfo = _$_CreateOrderStoreBaseActionController.startAction(
        name: '_CreateOrderStoreBase.clear');
    try {
      return super.clear();
    } finally {
      _$_CreateOrderStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
errorMessage: ${errorMessage},
receivedAt: ${receivedAt},
note: ${note},
payment: ${payment},
sellerId: ${sellerId},
seller: ${seller},
items: ${items},
address: ${address},
distance: ${distance},
shippingFee: ${shippingFee},
totalPrice: ${totalPrice},
itemsPrice: ${itemsPrice},
canCreateOrder: ${canCreateOrder}
    ''';
  }
}
