import 'package:dio/dio.dart';
import 'package:fruity/data/network/apis/order/order_api.dart';
import 'package:fruity/data/network/dio_client.dart';
import 'package:fruity/data/network/exceptions/network_exceptions.dart';
import 'package:fruity/dto/order/order_request.dart';
import 'package:mobx/mobx.dart';
part 'cancel_order_store.g.dart';

class CancelOrderStore = _CancelOrderStoreBase with _$CancelOrderStore;

abstract class _CancelOrderStoreBase with Store {
  final OrderAPI _orderAPI = OrderAPI(DioClient(Dio()));

  @observable
  bool isLoading = false;

  @observable
  String? errorMessage;

  @observable
  String orderId = '';

  @observable
  String note = '';

  @action
  void setOrderId(String id) => orderId = id;
  @action
  void setNote(String note) => this.note = note;

  @action
  Future<void> cancelOrder() async {
    isLoading = true;
    errorMessage = null;
    try {
      await _orderAPI
          .cancelOrder(CancelOrderRequest(orderId: orderId, note: note));
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
