import 'package:fruity/models/payment/payment.dart';
import 'package:fruity/widgets/user_address.dart';
import 'package:mobx/mobx.dart';
part 'confirm_order_store.g.dart';

class OrderConfirmationStore = _OrderConfirmationStoreBase
    with _$OrderConfirmationStore;

abstract class _OrderConfirmationStoreBase with Store {
  @observable
  DateTime receivedAt = DateTime.now();
  @observable
  String note = '';
  @observable
  UserAddress? userAddress;

  @observable
  Payment? payment;

  @action
  void setReceivedAt(DateTime receivedAt) {
    this.receivedAt = receivedAt;
  }

  @action
  void setNote(String note) {
    this.note = note;
  }

  @action
  void setUserAddress(UserAddress userAddress) {
    this.userAddress = userAddress;
  }

  @action
  void setPayment(Payment payment) {
    this.payment = payment;
  }
}
