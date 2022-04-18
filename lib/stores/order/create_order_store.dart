import 'package:dio/dio.dart';
import 'package:fruity/data/network/apis/order/order_api.dart';
import 'package:fruity/data/network/dio_client.dart';
import 'package:fruity/data/network/exceptions/network_exceptions.dart';
import 'package:fruity/dto/order/order_request.dart';
import 'package:fruity/models/cart/cart.dart';
import 'package:fruity/models/payment/payment.dart';
import 'package:fruity/models/seller/seller.dart';
import 'package:fruity/models/user_address/user_address.dart';
import 'package:mobx/mobx.dart';

part 'create_order_store.g.dart';

class CreateOrderStore = _CreateOrderStoreBase with _$CreateOrderStore;

abstract class _CreateOrderStoreBase with Store {
  final OrderAPI _orderAPI = OrderAPI(DioClient(Dio()));

  @observable
  bool isLoading = false;

  @observable
  String? errorMessage = null;

  @observable
  DateTime receivedAt = DateTime.now().add(const Duration(minutes: 30));

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
  double get itemsPrice => items.fold(
      0, (double sum, CartItem item) => sum + item.price * item.quantity);

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

  @action
  void clear() {
    items = [];
    userAddress = null;
    payment = null;
    seller = null;
    receivedAt = DateTime.now().add(const Duration(minutes: 30));
    note = '';
  }

  @action
  Future<void> createOrder() async {
    isLoading = true;
    final CreateOrderRequest request = CreateOrderRequest(
      note: note,
      userAddressId: userAddress != null ? userAddress!.id : null,
      paymentId: payment != null ? payment!.id : '',
      orderItems: items,
      receivedAt: receivedAt,
      sellerId: seller != null ? seller!.id : '',
    );

    try {
      await _orderAPI.createOrder(request);
    } catch (e) {
      if (e is NetworkException) {
        errorMessage = e.message;
      } else {
        errorMessage = e.toString();
      }
    } finally {
      isLoading = false;
    }
  }
}
