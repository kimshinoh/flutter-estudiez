// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PaymentStore on _PaymentStoreBase, Store {
  Computed<Payment?>? _$defaultPaymentComputed;

  @override
  Payment? get defaultPayment => (_$defaultPaymentComputed ??=
          Computed<Payment?>(() => super.defaultPayment,
              name: '_PaymentStoreBase.defaultPayment'))
      .value;

  late final _$paymentsAtom =
      Atom(name: '_PaymentStoreBase.payments', context: context);

  @override
  List<Payment> get payments {
    _$paymentsAtom.reportRead();
    return super.payments;
  }

  @override
  set payments(List<Payment> value) {
    _$paymentsAtom.reportWrite(value, super.payments, () {
      super.payments = value;
    });
  }

  late final _$errorAtom =
      Atom(name: '_PaymentStoreBase.error', context: context);

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

  late final _$loadingAtom =
      Atom(name: '_PaymentStoreBase.loading', context: context);

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

  late final _$getMyPaymentsAsyncAction =
      AsyncAction('_PaymentStoreBase.getMyPayments', context: context);

  @override
  Future<void> getMyPayments() {
    return _$getMyPaymentsAsyncAction.run(() => super.getMyPayments());
  }

  late final _$_PaymentStoreBaseActionController =
      ActionController(name: '_PaymentStoreBase', context: context);

  @override
  void clearPayments() {
    final _$actionInfo = _$_PaymentStoreBaseActionController.startAction(
        name: '_PaymentStoreBase.clearPayments');
    try {
      return super.clearPayments();
    } finally {
      _$_PaymentStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
payments: ${payments},
error: ${error},
loading: ${loading},
defaultPayment: ${defaultPayment}
    ''';
  }
}
