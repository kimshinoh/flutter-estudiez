// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'confirm_order_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$OrderConfirmationStore on _OrderConfirmationStoreBase, Store {
  final _$receivedAtAtom = Atom(name: '_OrderConfirmationStoreBase.receivedAt');

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

  final _$timeAtom = Atom(name: '_OrderConfirmationStoreBase.time');

  @override
  String get time {
    _$timeAtom.reportRead();
    return super.time;
  }

  @override
  set time(String value) {
    _$timeAtom.reportWrite(value, super.time, () {
      super.time = value;
    });
  }

  final _$noteAtom = Atom(name: '_OrderConfirmationStoreBase.note');

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

  final _$userAddressAtom =
      Atom(name: '_OrderConfirmationStoreBase.userAddress');

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

  final _$paymentAtom = Atom(name: '_OrderConfirmationStoreBase.payment');

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

  final _$timesCanSelectAtom =
      Atom(name: '_OrderConfirmationStoreBase.timesCanSelect');

  @override
  List<String> get timesCanSelect {
    _$timesCanSelectAtom.reportRead();
    return super.timesCanSelect;
  }

  @override
  set timesCanSelect(List<String> value) {
    _$timesCanSelectAtom.reportWrite(value, super.timesCanSelect, () {
      super.timesCanSelect = value;
    });
  }

  final _$_OrderConfirmationStoreBaseActionController =
      ActionController(name: '_OrderConfirmationStoreBase');

  @override
  void setReceivedAt(DateTime receivedAt) {
    final _$actionInfo = _$_OrderConfirmationStoreBaseActionController
        .startAction(name: '_OrderConfirmationStoreBase.setReceivedAt');
    try {
      return super.setReceivedAt(receivedAt);
    } finally {
      _$_OrderConfirmationStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTime(String time) {
    final _$actionInfo = _$_OrderConfirmationStoreBaseActionController
        .startAction(name: '_OrderConfirmationStoreBase.setTime');
    try {
      return super.setTime(time);
    } finally {
      _$_OrderConfirmationStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setNote(String note) {
    final _$actionInfo = _$_OrderConfirmationStoreBaseActionController
        .startAction(name: '_OrderConfirmationStoreBase.setNote');
    try {
      return super.setNote(note);
    } finally {
      _$_OrderConfirmationStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setUserAddress(UserAddress userAddress) {
    final _$actionInfo = _$_OrderConfirmationStoreBaseActionController
        .startAction(name: '_OrderConfirmationStoreBase.setUserAddress');
    try {
      return super.setUserAddress(userAddress);
    } finally {
      _$_OrderConfirmationStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPayment(Payment payment) {
    final _$actionInfo = _$_OrderConfirmationStoreBaseActionController
        .startAction(name: '_OrderConfirmationStoreBase.setPayment');
    try {
      return super.setPayment(payment);
    } finally {
      _$_OrderConfirmationStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic confirmReceivedAt() {
    final _$actionInfo = _$_OrderConfirmationStoreBaseActionController
        .startAction(name: '_OrderConfirmationStoreBase.confirmReceivedAt');
    try {
      return super.confirmReceivedAt();
    } finally {
      _$_OrderConfirmationStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
receivedAt: ${receivedAt},
time: ${time},
note: ${note},
userAddress: ${userAddress},
payment: ${payment},
timesCanSelect: ${timesCanSelect}
    ''';
  }
}
