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

part 'product_store.g.dart';

class ProductStore = _ProductStoreBase with _$ProductStore;

abstract class _ProductStoreBase with Store {
  final CategoryAPI _categoryAPI = CategoryAPI(DioClient(Dio()));

  final ProductAPI _productAPI = ProductAPI(DioClient(Dio()));

  @observable
  List<Product> products = [];

  @observable
  List<Product> productsTopSale = [];

  @observable
  List<Product> productsSaleOff = [];

  @observable
  List<Product> productsSaleShock = [];

  @observable
  List<Product> productsByIds = [];
  @observable
  bool loading = true;
  @observable
  bool idLoading = true;
  @observable
  String? errorMessage;

  @action
  Future<void> getProductsByIds(List<String> ids) async {
    try {
      idLoading = true;
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
      idLoading = false;
    }
  }

  @action
  Future<void> getProductsTopSale(int limit) async {
    try {
      loading = true;
      final ListProductsResponseDTO res = await _productAPI
          .getTopSaleProducts(ListProductRequestDTO(limit: limit));

      if (res.errorMessage != null) {
        errorMessage = res.errorMessage;
      } else {
        productsTopSale = res.products;
      }
    } catch (err) {
      errorMessage = err.toString();
    } finally {
      loading = false;
    }
  }

  @action
  Future<void> getProductsSaleShock(int limit) async {
    try {
      loading = true;
      final SaleShockReponseDTO res = await _productAPI
          .getSaleShockProducts(SaleShockRequestDTO(limit: limit));

      if (res.errorMessage != null) {
        errorMessage = res.errorMessage;
      } else {
        productsSaleShock = res.products;
      }
    } catch (err) {
      errorMessage = err.toString();
    } finally {
      loading = false;
    }
  }

  @action
  Future<void> getProductsSaleOff(int limit) async {
    try {
      loading = true;
      final SaleOffProductResponseDTO res = await _productAPI
          .getSaleOffProducts(SaleOffProductRequestDTO(limit: limit));

      if (res.errorMessage != null) {
        errorMessage = res.errorMessage;
      } else {
        productsSaleOff = res.products;
      }
    } catch (err) {
      errorMessage = err.toString();
    } finally {
      loading = false;
    }
  }

  @action
  Future<void> getProducts(String categoryId) async {
    try {
      loading = true;
      final ListProductsByCategoryResponse res =
          await _categoryAPI.getProductsByCategory(
        ListProductsByCategoryRequest(categoryId: categoryId),
      );
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

  @action
  void dispose() {
    products = [];
    productsTopSale = [];
    productsSaleOff = [];
    productsByIds = [];
    loading = true;
    // idLoading = true;
    errorMessage = null;
  }
}
