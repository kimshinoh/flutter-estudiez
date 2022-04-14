import 'package:fruity/models/cart/cart.dart';
import 'package:fruity/models/payment/payment.dart';
import 'package:fruity/models/seller/seller.dart';
import 'package:fruity/models/user_address/user_address.dart';
import 'package:mobx/mobx.dart';

part 'create_order_store.g.dart';

class CreateOrderStore = _CreateOrderStoreBase with _$CreateOrderStore;

abstract class _CreateOrderStoreBase with Store {
  @observable
  DateTime receivedAt = DateTime.now().add(Duration(minutes: 30));

  @observable
  String note = '';

  @observable
  UserAddress? userAddress;

  @observable
  Payment? payment;

  @observable
  Seller? seller;

  @observable
  List<CartItem> items = [];

  @observable
  double distance = 2;

  @computed
  double get feeShipping {
    return distance * 6000;
  }

  @computed
  double get totalPrice {
    return itemsPrice + feeShipping;
  }

  @computed
  double get itemsPrice =>
      items.fold(0, (sum, item) => sum + item.price * item.quantity);

  @action
  void setItems(List<CartItem> items) {
    this.items = items;
  }

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

  @action
  void setSeller(Seller seller) {
    this.seller = seller;
  }
}
