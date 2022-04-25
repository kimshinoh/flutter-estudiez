import 'package:dio/dio.dart';
import 'package:fruity/data/network/apis/search/search_api.dart';
import 'package:fruity/data/network/search_dio_client.dart';
import 'package:fruity/dto/product/product_request.dart';
import 'package:fruity/dto/product/product_response.dart';
import 'package:fruity/models/product/product.dart';
import 'package:fruity/models/search/product_simplify.dart';
import 'package:mobx/mobx.dart';

part 'search.g.dart';

class SearchProductStore = _SearchProductStoreBase with _$SearchProductStore;

abstract class _SearchProductStoreBase with Store {
  final SearchAPI _searchAPI = SearchAPI(SearchDioClient(Dio()));

  @observable
  List<ProductSimplify> products = [];

  @observable
  bool loading = true;
  @observable
  String keyword = "";
  @observable
  String? errorMessage;

  @action
  Future<void> searchProduct(int limit) async {
    if (keyword == '') return;
    try {
      loading = true;
      final SearchProductResponseDTO res = await _searchAPI.searchProducts(
          SearchProductRequestDTO(limit: limit, keyword: keyword));
      if (res.errorMessage != null) {
        errorMessage = res.errorMessage;
      } else {
        products = res.productSearch.products;
      }
    } catch (err) {
      errorMessage = err.toString();
    } finally {
      loading = false;
    }
  }
  @computed
  List<String> get productIds => products.map((e) => e.id).toList();

  @action
  void dispose() {
    keyword = "";
    products = [];
    loading = true;
    errorMessage = null;
  }
}
