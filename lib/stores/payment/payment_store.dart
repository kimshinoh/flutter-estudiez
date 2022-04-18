import 'package:collection/collection.dart';
import 'package:dio/dio.dart';
import 'package:fruity/data/network/apis/payment/payment_api.dart';
import 'package:fruity/data/network/dio_client.dart';
import 'package:fruity/data/network/exceptions/network_exceptions.dart';
import 'package:fruity/dto/payment/payment_request.dart';
import 'package:fruity/dto/payment/payment_response.dart';
import 'package:fruity/models/payment/payment.dart';
import 'package:mobx/mobx.dart';

part 'payment_store.g.dart';

class PaymentStore = _PaymentStoreBase with _$PaymentStore;

abstract class _PaymentStoreBase with Store {
  final PaymentAPI _paymentAPI = PaymentAPI(DioClient(Dio()));

  @observable
  List<Payment> payments = [];

  @observable
  String? error;

  @observable
  bool loading = false;

  @computed
  Payment? get defaultPayment => payments.firstWhereOrNull(
        (Payment payment) => payment.isDefault,
      );

  @action
  void clearPayments() {
    payments = [];
  }

  @action
  Future<void> getMyPayments() async {
    try {
      loading = true;
      final MyPaymentsResponse res =
          await _paymentAPI.getMyPayments(MyPaymentRequest());
      if (res.errorMessage != null) {
        error = res.errorMessage;
      } else {
        payments = res.payments;
      }
    } catch (e) {
      if (e is NetworkException) {
        error = e.message ?? 'Có lỗi xảy ra';
      } else {
        error = e.toString();
      }
    } finally {
      loading = false;
    }
  }
}
