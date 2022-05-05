import 'package:dio/dio.dart';
import 'package:fruity/data/network/apis/cateory/category_api.dart';
import 'package:fruity/data/network/apis/product/product_api.dart';
import 'package:fruity/data/network/dio_client.dart';
import 'package:fruity/dto/category/category_request.dart';
import 'package:fruity/dto/category/category_response.dart';
import 'package:fruity/dto/product/product_request.dart';
import 'package:fruity/dto/product/product_response.dart';
import 'package:fruity/models/product/product.dart';
import 'package:mobx/mobx.dart';

part 'search_product_store.g.dart';

class SearchProductStore = _SearchProductStoreBase with _$SearchProductStore;

abstract class _SearchProductStoreBase with Store {
  final ProductAPI _productAPI = ProductAPI(DioClient(Dio()));

  @observable
  List<Product> productsByIds = [];
  @observable
  bool loading = true;
  @observable
  String? errorMessage;
  @observable
  int searchType = 0;

  @action
  Future<void> getProductsByIds(List<String> ids) async {
    try {
      loading = true;
      final ProductsByIdsResponseDTO res =
          await _productAPI.getProductsByIds(ProductsByIdsRequestDTO(ids: ids));
      if (res.errorMessage != null) {
        errorMessage = res.errorMessage;
      } else {
        productsByIds = res.products;
      }
    } catch (err) {
      errorMessage = err.toString();
    } finally {
      loading = false;
    }
  }

  @computed
  List<Product> get products {
    switch (searchType) {
      case 0:
        return productsByIds;
      case 1:
        productsByIds.sort((a, b) => a.price.compareTo(b.price));
        return productsByIds;
      case 2:
        productsByIds.sort((a, b) => b.price.compareTo(a.price));
        return productsByIds;
      default:
        return [];
    }
  }

  @action
  void dispose() {
    productsByIds = [];
    loading = true;
    searchType = 0;
    errorMessage = null;
  }
}
