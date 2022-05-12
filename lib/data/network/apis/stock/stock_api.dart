import 'package:fruity/data/network/dio_client.dart';
import 'package:fruity/data/network/exceptions/network_exceptions.dart';
import 'package:fruity/dto/stock/stock_response.dart';

class StockAPI {
  DioClient _dioClient;

  StockAPI(this._dioClient);

  Future<GetStockByProductIdResponse> getStockByProductId(String id) async {
    try {
      final Map<String, dynamic> response =
          await _dioClient.get('/stocks/products/$id');
      return GetStockByProductIdResponse.fromJson(response);
    } catch (e) {
      if (e is NetworkException) {
        return GetStockByProductIdResponse.withError(
          e.message ?? 'Có lỗi xảy ra',
        );
      } else {
        return GetStockByProductIdResponse.withError(e.toString());
      }
    }
  }
}
