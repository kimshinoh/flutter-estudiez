import 'package:dio/dio.dart';
import 'package:fruity/data/network/apis/cateory/category_api.dart';
import 'package:fruity/data/network/dio_client.dart';
import 'package:fruity/dto/category/category_request.dart';
import 'package:fruity/dto/category/category_response.dart';
import 'package:fruity/models/product/product.dart';
import 'package:mobx/mobx.dart';

part 'product_store.g.dart';

class ProductStore = _ProductStoreBase with _$ProductStore;

abstract class _ProductStoreBase with Store {
  final CategoryAPI _categoryAPI = CategoryAPI(DioClient(Dio()));

  @observable
  List<Product> products = [];

  @observable
  bool loading = true;

  @observable
  String? errorMessage;

  @action
  Future<void> getProducts(String categoryId) async {
    try {
      loading = true;
      final ListProductsByCategoryResponse res =
          await _categoryAPI.getProductsByCategory(
              ListProductsByCategoryRequest(categoryId: categoryId),);

      if (res.errorMessage != null) {
        errorMessage = res.errorMessage;
      } else {
        products = res.products;
      }
    } catch (err) {
      errorMessage = err.toString();
    } finally {
      loading = false;
    }
  }
}
