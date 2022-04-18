import 'package:fruity/data/network/dio_client.dart';
import 'package:fruity/data/network/exceptions/network_exceptions.dart';
import 'package:fruity/dto/payment/payment_request.dart';
import 'package:fruity/dto/payment/payment_response.dart';

class PaymentAPI {
  DioClient _dioClient;

  PaymentAPI(this._dioClient);

  Future<MyPaymentsResponse> getMyPayments(MyPaymentRequest req) async {
    try {
      final Map<String, dynamic> response =
          await _dioClient.get('/payments', queryParameters: req.toJson());

      return MyPaymentsResponse.fromJson(response);
    } catch (e) {
      if (e is NetworkException) {
        return MyPaymentsResponse.withError(
          e.message ?? 'Có lỗi xảy ra',
        );
      }
      return MyPaymentsResponse.withError(e.toString());
    }
  }
}
