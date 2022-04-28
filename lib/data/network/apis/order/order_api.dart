import 'package:fruity/data/network/dio_client.dart';
import 'package:fruity/data/network/exceptions/network_exceptions.dart';
import 'package:fruity/dto/order/order_request.dart';
import 'package:fruity/dto/order/order_response.dart';

class OrderAPI {
  final DioClient _dioClient;

  OrderAPI(this._dioClient);

  Future<CreateOrderResponse> createOrder(CreateOrderRequest request) async {
    try {
      final Map<String, dynamic> response =
          await _dioClient.post('/orders', data: request.toJson());

      return CreateOrderResponse.fromJson(response);
    } catch (e) {
      if (e is NetworkException) {
        return CreateOrderResponse.withError(
          e.message ?? 'Có lỗi xảy ra',
        );
      }
      return CreateOrderResponse.withError(e.toString());
    }
  }

  Future<MyOrdersResponse> getMyOrders(MyOrdersRequest request) async {
    try {
      final Map<String, dynamic> response =
          await _dioClient.get('/orders', queryParameters: request.toJson());

      return MyOrdersResponse.fromJson(response);
    } catch (e) {
      if (e is NetworkException) {
        return MyOrdersResponse.withError(
          e.message ?? 'Có lỗi xảy ra',
        );
      }
      return MyOrdersResponse.withError(e.toString());
    }
  }

  Future<GetOrderByIdResponse> getOrderById(GetOrderByIdRequest request) async {
    try {
      final Map<String, dynamic> response = await _dioClient.get(
        '/orders/${request.orderId}',
      );

      return GetOrderByIdResponse.fromJson(response);
    } catch (e) {
      if (e is NetworkException) {
        return GetOrderByIdResponse.withError(
          e.message ?? 'Có lỗi xảy ra',
        );
      }
      return GetOrderByIdResponse.withError(e.toString());
    }
  }
}
