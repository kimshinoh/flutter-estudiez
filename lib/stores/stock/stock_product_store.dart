import 'package:dio/dio.dart';
import 'package:fruity/data/network/apis/stock/stock_api.dart';
import 'package:fruity/data/network/dio_client.dart';
import 'package:fruity/dto/stock/stock_response.dart';
import 'package:fruity/models/stock/stock.dart';
import 'package:mobx/mobx.dart';
part 'stock_product_store.g.dart';

class StockProductStore = _StockProductStoreBase with _$StockProductStore;

abstract class _StockProductStoreBase with Store {
  StockAPI _stockAPI = StockAPI(DioClient(Dio()));

  @observable
  bool isLoading = false;

  @observable
  Stock? stock;

  @action
  Future<void> getStockByProductId(String id) async {
    isLoading = true;
    stock = null;

    final GetStockByProductIdResponse response =
        await _stockAPI.getStockByProductId(id);

    if (response.stock != null) {
      stock = response.stock;
    }
  }
}
