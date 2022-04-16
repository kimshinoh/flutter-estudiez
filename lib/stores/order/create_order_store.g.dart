// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_order_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CreateOrderStore on _CreateOrderStoreBase, Store {
  Computed<double>? _$feeShippingComputed;

  @override
  double get feeShipping => (_$feeShippingComputed ??= Computed<double>(
        () => super.feeShipping,
        name: '_CreateOrderStoreBase.feeShipping',
      ))
          .value;
  Computed<double>? _$totalPriceComputed;

  @override
  double get totalPrice => (_$totalPriceComputed ??= Computed<double>(
        () => super.totalPrice,
        name: '_CreateOrderStoreBase.totalPrice',
      ))
          .value;
  Computed<double>? _$itemsPriceComputed;

  @override
  double get itemsPrice => (_$itemsPriceComputed ??= Computed<double>(
        () => super.itemsPrice,
        name: '_CreateOrderStoreBase.itemsPrice',
      ))
          .value;

  final Atom _$receivedAtAtom = Atom(name: '_CreateOrderStoreBase.receivedAt');

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

  final Atom _$noteAtom = Atom(name: '_CreateOrderStoreBase.note');

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

  final Atom _$userAddressAtom =
      Atom(name: '_CreateOrderStoreBase.userAddress');

  @override
  UserAddress? get userAddress {
    _$userAddressAtom.reportRead();
    return super.userAddress;
  }

  @override
  set userAddress(UserAddress? value) {
    _$userAddressAtom.reportWrite(value, super.userAddress, () {
      super.userAddress = value;
    });
  }

  final Atom _$paymentAtom = Atom(name: '_CreateOrderStoreBase.payment');

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

  final Atom _$sellerAtom = Atom(name: '_CreateOrderStoreBase.seller');

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

  final Atom _$itemsAtom = Atom(name: '_CreateOrderStoreBase.items');

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

  final Atom _$distanceAtom = Atom(name: '_CreateOrderStoreBase.distance');

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

  final AsyncAction _$createOrderAsyncAction =
      AsyncAction('_CreateOrderStoreBase.createOrder');

  @override
  Future<void> createOrder() {
    return _$createOrderAsyncAction.run(() => super.createOrder());
  }

  final ActionController _$_CreateOrderStoreBaseActionController =
      ActionController(name: '_CreateOrderStoreBase');

  @override
  void setItems(List<CartItem> items) {
    final ActionRunInfo _$actionInfo =
        _$_CreateOrderStoreBaseActionController.startAction(
      name: '_CreateOrderStoreBase.setItems',
    );
    try {
      return super.setItems(items);
    } finally {
      _$_CreateOrderStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setReceivedAt(DateTime receivedAt) {
    final ActionRunInfo _$actionInfo =
        _$_CreateOrderStoreBaseActionController.startAction(
      name: '_CreateOrderStoreBase.setReceivedAt',
    );
    try {
      return super.setReceivedAt(receivedAt);
    } finally {
      _$_CreateOrderStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setNote(String note) {
    final ActionRunInfo _$actionInfo =
        _$_CreateOrderStoreBaseActionController.startAction(
      name: '_CreateOrderStoreBase.setNote',
    );
    try {
      return super.setNote(note);
    } finally {
      _$_CreateOrderStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setUserAddress(UserAddress userAddress) {
    final ActionRunInfo _$actionInfo =
        _$_CreateOrderStoreBaseActionController.startAction(
      name: '_CreateOrderStoreBase.setUserAddress',
    );
    try {
      return super.setUserAddress(userAddress);
    } finally {
      _$_CreateOrderStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPayment(Payment payment) {
    final ActionRunInfo _$actionInfo =
        _$_CreateOrderStoreBaseActionController.startAction(
      name: '_CreateOrderStoreBase.setPayment',
    );
    try {
      return super.setPayment(payment);
    } finally {
      _$_CreateOrderStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSeller(Seller seller) {
    final ActionRunInfo _$actionInfo =
        _$_CreateOrderStoreBaseActionController.startAction(
      name: '_CreateOrderStoreBase.setSeller',
    );
    try {
      return super.setSeller(seller);
    } finally {
      _$_CreateOrderStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
receivedAt: ${receivedAt},
note: ${note},
userAddress: ${userAddress},
payment: ${payment},
seller: ${seller},
items: ${items},
distance: ${distance},
feeShipping: ${feeShipping},
totalPrice: ${totalPrice},
itemsPrice: ${itemsPrice}
    ''';
  }
}
