import 'package:dio/dio.dart';
import 'package:fruity/data/network/apis/order/order_api.dart';
import 'package:fruity/data/network/dio_client.dart';
import 'package:fruity/dto/order/order_request.dart';
import 'package:fruity/dto/order/order_response.dart';
import 'package:fruity/models/order/order.dart';
import 'package:mobx/mobx.dart';
part 'order_detail_store.g.dart';

class OrderDetailStore = _OrderDetailStoreBase with _$OrderDetailStore;

abstract class _OrderDetailStoreBase with Store {
  _OrderDetailStoreBase();

  OrderAPI _orderApi = OrderAPI(DioClient(Dio()));

  @observable
  Order? order;

  @observable
  bool isLoading = false;

  @observable
  String? error;

  @action
  Future<void> getOrderDetail(String orderId) async {
    isLoading = true;
    error = '';
    try {
      final GetOrderByIdResponse res =
          await _orderApi.getOrderById(GetOrderByIdRequest(orderId: orderId));
      if (res.errorMessage != null) {
        error = res.errorMessage;
      } else {
        order = res.order;
      }
    } catch (e) {
      error = e.toString();
    }
    isLoading = false;
  }
}
