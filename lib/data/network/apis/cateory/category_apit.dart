import 'package:fruity/data/network/dio_client.dart';
import 'package:fruity/data/network/exceptions/network_exceptions.dart';
import 'package:fruity/dto/category/category_request.dart';
import 'package:fruity/dto/category/category_response.dart';
import 'package:fruity/models/category/category.dart';

List<Category> _categories = [
  Category(
    id: '86',
    name: 'Trái cây',
    imageUrl:
        'https://images.f99.com.vn/notification-images/7397bab3-fc14-47ab-866d-3279e9d41e59.png',
  ),
  Category(
    id: '87',
    name: 'Thực phẩm',
    imageUrl:
        'https://images.f99.com.vn/notification-images/7dedbb4c-34ae-4bbf-983b-4ce69686fad3.png',
  ),
  Category(
    id: '88',
    name: 'Đồ uống',
    imageUrl:
        'https://images.f99.com.vn/notification-images/0d0858f1-fc05-48c3-a21a-e932d3ab68c0.png',
  ),
  Category(
    id: '89',
    name: 'Đồ ăn',
    imageUrl:
        'https://images.f99.com.vn/notification-images/fbb69504-680d-46db-9b1a-84c7f7f4b115.png',
  ),
  Category(
    id: '90',
    name: 'Đồ điện tử',
    imageUrl:
        'https://images.f99.com.vn/notification-images/7dedbb4c-34ae-4bbf-983b-4ce69686fad3.png',
  ),
  Category(
    id: '111',
    name: 'Đồ gia dụng',
    imageUrl:
        'https://images.f99.com.vn/notification-images/b2605147-e134-4ffb-ba00-151e6bcb8034.png',
  ),
  Category(
    id: '1222',
    name: 'Đồ ăn',
    imageUrl:
        'https://images.f99.com.vn/notification-images/fbb69504-680d-46db-9b1a-84c7f7f4b115.png',
  ),
  Category(
    id: '333',
    name: 'Đồ điện tử',
    imageUrl:
        'https://images.f99.com.vn/notification-images/7dedbb4c-34ae-4bbf-983b-4ce69686fad3.png',
  ),
  Category(
    id: '444',
    name: 'Đồ gia dụng',
    imageUrl:
        'https://images.f99.com.vn/notification-images/b2605147-e134-4ffb-ba00-151e6bcb8034.png',
  ),
];

class CategoryAPI {
  final DioClient _dioClient;

  CategoryAPI(this._dioClient);

  Future<CategoryListResponse> getParentCategories(
      CategoryListRequest req) async {
    try {
      // final Map<String, dynamic> response = await _dioClient.get(
      //   '/categories/parent',
      //   queryParameters: req.query,
      // );
      return CategoryListResponse(categories: _categories);
      // return CategoryListResponse.fromJson(response);
    } catch (e) {
      if (e is NetworkException) {
        return CategoryListResponse.withError(
          e.message ?? 'Có lỗi xảy ra',
        );
      }
      return CategoryListResponse.withError(e.toString());
    }
  }

  Future<CategoryListResponse> getChildCategories(
      CategoryListRequest req) async {
    try {
      final Map<String, dynamic> response = await _dioClient.get(
        '/categories/child',
        queryParameters: req.query,
      );

      return CategoryListResponse.fromJson(response);
    } catch (e) {
      if (e is NetworkException) {
        return CategoryListResponse.withError(
          e.message ?? 'Có lỗi xảy ra',
        );
      }
      return CategoryListResponse.withError(e.toString());
    }
  }
}
