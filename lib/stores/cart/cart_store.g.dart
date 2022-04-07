// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CartStore on _CartStoreBase, Store {
  Computed<bool>? _$canIncreaseQuantityComputed;

  @override
  bool get canIncreaseQuantity => (_$canIncreaseQuantityComputed ??=
          Computed<bool>(() => super.canIncreaseQuantity,
              name: '_CartStoreBase.canIncreaseQuantity'))
      .value;
  Computed<bool>? _$canDecreaseQuantityComputed;

  @override
  bool get canDecreaseQuantity => (_$canDecreaseQuantityComputed ??=
          Computed<bool>(() => super.canDecreaseQuantity,
              name: '_CartStoreBase.canDecreaseQuantity'))
      .value;
  Computed<bool>? _$canAddToCartComputed;

  @override
  bool get canAddToCart =>
      (_$canAddToCartComputed ??= Computed<bool>(() => super.canAddToCart,
              name: '_CartStoreBase.canAddToCart'))
          .value;

  final _$itemsAtom = Atom(name: '_CartStoreBase.items');

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

  final _$isLoadingAtom = Atom(name: '_CartStoreBase.isLoading');

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

  final _$errorAtom = Atom(name: '_CartStoreBase.error');

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

  final _$qtyAtom = Atom(name: '_CartStoreBase.qty');

  @override
  int get qty {
    _$qtyAtom.reportRead();
    return super.qty;
  }

  @override
  set qty(int value) {
    _$qtyAtom.reportWrite(value, super.qty, () {
      super.qty = value;
    });
  }

  final _$addItemAsyncAction = AsyncAction('_CartStoreBase.addItem');

  @override
  Future<void> addItem(CartItem item) {
    return _$addItemAsyncAction.run(() => super.addItem(item));
  }

  final _$updateQuantityAsyncAction =
      AsyncAction('_CartStoreBase.updateQuantity');

  @override
  Future<void> updateQuantity(CartItem item, int quantty) {
    return _$updateQuantityAsyncAction
        .run(() => super.updateQuantity(item, quantty));
  }

  final _$removeItemAsyncAction = AsyncAction('_CartStoreBase.removeItem');

  @override
  Future<void> removeItem(CartItem item) {
    return _$removeItemAsyncAction.run(() => super.removeItem(item));
  }

  final _$_CartStoreBaseActionController =
      ActionController(name: '_CartStoreBase');

  @override
  void validateQuantity(String quantity) {
    final _$actionInfo = _$_CartStoreBaseActionController.startAction(
        name: '_CartStoreBase.validateQuantity');
    try {
      return super.validateQuantity(quantity);
    } finally {
      _$_CartStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clear() {
    final _$actionInfo = _$_CartStoreBaseActionController.startAction(
        name: '_CartStoreBase.clear');
    try {
      return super.clear();
    } finally {
      _$_CartStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void cleanQty() {
    final _$actionInfo = _$_CartStoreBaseActionController.startAction(
        name: '_CartStoreBase.cleanQty');
    try {
      return super.cleanQty();
    } finally {
      _$_CartStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void decreaseQuantity() {
    final _$actionInfo = _$_CartStoreBaseActionController.startAction(
        name: '_CartStoreBase.decreaseQuantity');
    try {
      return super.decreaseQuantity();
    } finally {
      _$_CartStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void increaseQuantity() {
    final _$actionInfo = _$_CartStoreBaseActionController.startAction(
        name: '_CartStoreBase.increaseQuantity');
    try {
      return super.increaseQuantity();
    } finally {
      _$_CartStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
items: ${items},
isLoading: ${isLoading},
error: ${error},
qty: ${qty},
canIncreaseQuantity: ${canIncreaseQuantity},
canDecreaseQuantity: ${canDecreaseQuantity},
canAddToCart: ${canAddToCart}
    ''';
  }
}
