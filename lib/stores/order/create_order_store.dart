import 'package:dio/dio.dart';
import 'package:fruity/data/network/apis/order/order_api.dart';
import 'package:fruity/data/network/dio_client.dart';
import 'package:fruity/data/network/exceptions/network_exceptions.dart';
import 'package:fruity/dto/order/order_request.dart';
import 'package:fruity/models/cart/cart.dart';
import 'package:fruity/models/payment/payment.dart';
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
  Payment? payment;

  @observable
  String? sellerId;

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
  void setPayment(Payment payment) {
    this.payment = payment;
  }

  @action
  void setSellerId(String sellerId) {
    this.sellerId = sellerId;
  }

  @action
  void clear() {
    items = [];
    payment = null;
    sellerId = null;
    receivedAt = DateTime.now().add(const Duration(minutes: 30));
    note = '';
  }

  @computed
  bool get canCreateOrder {
    return items.isNotEmpty && payment != null && sellerId != null;
  }

  @action
  Future<void> createOrder(UserAddress userAddress) async {
    isLoading = true;
    final CreateOrderRequest request = CreateOrderRequest(
      note: note,
      userAddressId: userAddress.id,
      paymentId: payment != null ? payment!.id : '',
      orderItems: items,
      receivedAt: receivedAt,
      sellerId: sellerId ?? '',
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
