// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'confirm_order_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$OrderConfirmationStore on _OrderConfirmationStoreBase, Store {
  late final _$receivedAtAtom =
      Atom(name: '_OrderConfirmationStoreBase.receivedAt', context: context);

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

  late final _$timeAtom =
      Atom(name: '_OrderConfirmationStoreBase.time', context: context);

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

  late final _$timesCanSelectAtom = Atom(
      name: '_OrderConfirmationStoreBase.timesCanSelect', context: context);

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

  late final _$_OrderConfirmationStoreBaseActionController =
      ActionController(name: '_OrderConfirmationStoreBase', context: context);

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
  void dispose() {
    final _$actionInfo = _$_OrderConfirmationStoreBaseActionController
        .startAction(name: '_OrderConfirmationStoreBase.dispose');
    try {
      return super.dispose();
    } finally {
      _$_OrderConfirmationStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
receivedAt: ${receivedAt},
time: ${time},
timesCanSelect: ${timesCanSelect}
    ''';
  }
}
