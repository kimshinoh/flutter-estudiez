import 'package:dio/dio.dart';
import 'package:fruity/data/network/apis/cateory/category_api.dart';
import 'package:fruity/data/network/apis/product/product_api.dart';
import 'package:fruity/data/network/dio_client.dart';
import 'package:fruity/data/network/exceptions/network_exceptions.dart';
import 'package:fruity/dto/category/category_request.dart';
import 'package:fruity/dto/category/category_response.dart';
import 'package:fruity/dto/product/product_response.dart';
import 'package:fruity/models/product/product.dart';
import 'package:mobx/mobx.dart';

part 'product_detail_store.g.dart';

class ProductDetailStore = _ProductDetailStoreBase with _$ProductDetailStore;

abstract class _ProductDetailStoreBase with Store {
  ProductAPI _productAPI = ProductAPI(DioClient(Dio()));

  CategoryAPI _categoryAPI = CategoryAPI(DioClient(Dio()));

  List<ReactionDisposer> _disposers = [];

  void setupUpdateProduct() {
    _disposers.add(
      reaction(
        (_) => product,
        (Product? product) {
          if (product != null) {
            _categoryAPI
                .getProductsByCategory(ListProductsByCategoryRequest(
                    categoryId: product.categoryId))
                .then((ListProductsByCategoryResponse res) {
              relateProducts = res.products;
            });
          }
        },
      ),
    );
  }

  @observable
  bool isLoading = false;

  @observable
  String? errorMessage;

  @observable
  Product? product;

  @observable
  List<Product> relateProducts = [];

  @action
  Future<void> getProductDetail(String productId) async {
    isLoading = true;
    errorMessage = null;
    try {
      final GetProductByIdResponse response =
          await _productAPI.getProductById(productId);
      if (response.errorMessage != null) {
        errorMessage = response.errorMessage;
      } else {
        product = response.product;
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
