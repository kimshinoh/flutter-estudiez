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

  List<SortProduct> sortProducts = [
    SortProduct(
      name: 'A - Z',
      value: 'name',
    ),
    SortProduct(
      name: 'Z - A',
      value: '-name',
    ),
    SortProduct(
      name: 'Giá cao nhất',
      value: 'price',
    ),
    SortProduct(
      name: 'Giá thấp nhất',
      value: '-price',
    ),
  ];

  @observable
  SortProduct sortProduct = SortProduct(name: 'A - Z', value: 'name');

  @action
  void setSortProduct(SortProduct sortProduct) {
    this.sortProduct = sortProduct;
  }

  @observable
  List<Product> products = [];

  @computed
  List<Product> get sortedProducts {
    return products
      ..sort((a, b) {
        switch (sortProduct.value) {
          case 'name':
            return a.name.compareTo(b.name);
          case '-name':
            return b.name.compareTo(a.name);
          case 'price':
            return b.price.compareTo(a.price);
          case '-price':
            return a.price.compareTo(b.price);
          default:
            return a.name.compareTo(b.name);
        }
      });
  }

  @observable
  List<Product> productsTopSale = [];

  @observable
  List<Product> productsSaleOff = [];

  @observable
  List<Product> productsSaleShock = [];
  @observable
  List<Product> productsTopSaleBig = [];

  @observable
  List<Product> productsSaleOffBig = [];

  @observable
  List<Product> productsSaleShockBig = [];

  @observable
  bool loading = true;
  @observable
  String? errorMessage;

  @action
  Future<void> getProductsTopSale(int limit) async {
    try {
      loading = true;
      final ListProductsResponseDTO res = await _productAPI
          .getTopSaleProducts(ListProductRequestDTO(limit: limit));

      if (res.errorMessage != null) {
        errorMessage = res.errorMessage;
      } else {
        if (limit > 20) {
          productsTopSaleBig = res.products;
        } else {
          productsTopSale = res.products;
        }
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
        if (limit > 20) {
          productsSaleShockBig = res.products;
        } else {
          productsSaleShock = res.products;
        }
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
        if (limit > 20) {
          productsSaleOffBig = res.products;
        } else {
          productsSaleOff = res.products;
        }
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
    loading = true;
    // idLoading = true;
    errorMessage = null;
    productsSaleOffBig = [];
    productsSaleShockBig = [];
    productsTopSaleBig = [];
  }

  @action
  void disposeBig() {
    loading = true;
    errorMessage = null;
    productsSaleOffBig = [];
    productsSaleShockBig = [];
    productsTopSaleBig = [];
  }
}

class SortProduct {
  final String name;
  final String value;

  SortProduct({required this.name, required this.value});
}
