import 'package:dio/dio.dart';
import 'package:fruity/data/network/apis/order/order_api.dart';
import 'package:fruity/data/network/dio_client.dart';
import 'package:fruity/data/network/exceptions/network_exceptions.dart';
import 'package:fruity/dto/order/order_request.dart';
import 'package:fruity/dto/order/order_response.dart';
import 'package:fruity/models/order/order.dart';
import 'package:mobx/mobx.dart';
part 'orders_store.g.dart';

class OrdersStore = _OrdersStoreBase with _$OrdersStore;

abstract class _OrdersStoreBase with Store {
  OrderAPI _orderAPI = OrderAPI(DioClient(Dio()));

  @observable
  bool isLoading = false;

  @observable
  String? errorMessage;

  @observable
  List<Order> orders = [];

  @computed
  List<Order> get processingOrders => orders
      .where(
        (Order order) =>
            order.status == 'processing' || order.status == 'shipping',
      )
      .toList();

  @computed
  List<Order> get completedOrders => orders
      .where(
        (Order order) =>
            order.status == 'delivered' || order.status == 'cancelled',
      )
      .toList();

  @action
  Future<void> getMyOrders(String status) async {
    isLoading = true;
    errorMessage = null;
    try {
      final MyOrdersResponse response =
          await _orderAPI.getMyOrders(MyOrdersRequest(status: status));

      if (response.errorMessage != null) {
        errorMessage = response.errorMessage;
      } else {
        orders = response.orders;
      }
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
