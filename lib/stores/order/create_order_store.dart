import 'package:dio/dio.dart';
import 'package:fruity/data/network/apis/order/order_api.dart';
import 'package:fruity/data/network/dio_client.dart';
import 'package:fruity/data/network/exceptions/network_exceptions.dart';
import 'package:fruity/dto/order/order_request.dart';
import 'package:fruity/models/cart/cart.dart';
import 'package:fruity/models/payment/payment.dart';
import 'package:fruity/models/seller/seller.dart';
import 'package:fruity/models/user_address/user_address.dart';
import 'package:fruity/utils/location_util.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mobx/mobx.dart';

part 'create_order_store.g.dart';

class CreateOrderStore = _CreateOrderStoreBase with _$CreateOrderStore;

abstract class _CreateOrderStoreBase with Store {
  final OrderAPI _orderAPI = OrderAPI(DioClient(Dio()));

  List<ReactionDisposer> _disposers = [];

  void setupUpdateAddress() {
    _disposers = [
      reaction((_) => address, (_) {
        if (address != null) {
          calcDistance();
        }
      }),
    ];
  }

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
  Seller? seller;

  @observable
  List<CartItem> items = [];

  @observable
  UserAddress? address;

  @observable
  double distance = 2;

  @computed
  double get shippingFee {
    return distance * 6000;
  }

  @computed
  double get totalPrice {
    return itemsPrice + shippingFee;
  }

  @computed
  double get itemsPrice => items.fold(
        0,
        (double sum, CartItem item) => sum + item.price * item.quantity,
      );

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
  void setSeller(Seller seller) {
    this.seller = seller;
  }

  @action
  void setAddress(UserAddress? address) {
    this.address = address;
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
  Future<void> calcDistance() async {
    if (seller == null) {
      return;
    }
    final Location _location =
        await LocationHelper.determineLocation(seller!.headQuarter);

    distance = double.parse(
      LocationHelper.calculateDistance(
        address!.latitude,
        address!.longitude,
        _location.latitude,
        _location.longitude,
      ).toStringAsFixed(1),
    );
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
      shippingFee: shippingFee,
      shippingDistance: distance,
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
