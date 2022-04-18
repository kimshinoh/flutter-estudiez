import 'package:fruity/models/payment/payment.dart';
import 'package:fruity/models/user_address/user_address.dart';
import 'package:fruity/stores/order/create_order_store.dart';
import 'package:fruity/utils/datetime_util.dart';
import 'package:mobx/mobx.dart';

part 'confirm_order_store.g.dart';

class OrderConfirmationStore = _OrderConfirmationStoreBase
    with _$OrderConfirmationStore;

abstract class _OrderConfirmationStoreBase with Store {
  DateTime endOfDay = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
    22,
  );
  DateTime startOfDay = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
    9,
  );

  CreateOrderStore createOrderStore = CreateOrderStore();

  List<ReactionDisposer> _disposers = [];

  void setupUpdateRecevedAt() {
    _disposers = [
      reaction((_) => receivedAt, (_) {
        timesCanSelect = updateSelectTimes();
        time = timesCanSelect[0];
      }),
    ];
  }

  List<String> updateSelectTimes() {
    final List<String> hours =
        DateTimeHelper.getTimesBetween(startOfDay, endOfDay, 30);

    final bool isToday = DateTime.now().day == receivedAt.day;
    final bool isAfterEndTime = DateTime.now().hour > endOfDay.hour;
    final bool isBeforeStartTime = DateTime.now().hour < startOfDay.hour;

    if (isToday) {
      if (isAfterEndTime) {
        return [];
      }
      if (isBeforeStartTime) {
        return hours;
      }

      return DateTimeHelper.getTimesBetween(DateTime.now(), endOfDay, 30);
    }
    return hours;
  }

  _OrderConfirmationStoreBase() {
    timesCanSelect = updateSelectTimes();
    if (timesCanSelect.isNotEmpty) {
      time = timesCanSelect[0];
    }
  }

  @observable
  DateTime receivedAt = DateTime.now();

  @observable
  String time = DateTimeHelper.formatDate(DateTime.now(), 'HH:mm');

  @observable
  String note = '';
  @observable
  UserAddress? userAddress;

  @observable
  Payment? payment;

  @observable
  List<String> timesCanSelect = [];

  List<DateTime> get getDatesCanSelect {
    final DateTime now = DateTime.now();
    return [
      now,
      now.add(const Duration(days: 1)),
      now.add(const Duration(days: 2)),
    ];
  }

  @action
  void setReceivedAt(DateTime receivedAt) {
    this.receivedAt = receivedAt;
  }

  @action
  void setTime(String time) {
    this.time = time;
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

  @action
  confirmReceivedAt() {
    final DateTime receivedAt = DateTime.parse(
      '${DateTimeHelper.formatDate(this.receivedAt, "yyyy-MM-dd")} $time:00',
    );

    createOrderStore.setReceivedAt(receivedAt);
  }

  @action
  void dispose() {
    for (final ReactionDisposer d in _disposers) {
      d();
    }
  }
}
