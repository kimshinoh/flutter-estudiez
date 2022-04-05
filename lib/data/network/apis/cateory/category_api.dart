import 'package:fruity/data/network/dio_client.dart';
import 'package:fruity/data/network/exceptions/network_exceptions.dart';
import 'package:fruity/dto/category/category_request.dart';
import 'package:fruity/dto/category/category_response.dart';

class CategoryAPI {
  final DioClient _dioClient;

  CategoryAPI(this._dioClient);

  Future<CategoryListResponse> getParentCategories(
      CategoryListRequest req) async {
    try {
      final Map<String, dynamic> response = await _dioClient.get(
        '/categories',
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

  Future<CategoryListResponse> getChildCategories(
      CategoryListRequest req) async {
    try {
      final Map<String, dynamic> response = await _dioClient.get(
        '/categories',
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

  Future<ListProductsByCategoryResponse> getProductsByCategory(
    ListProductsByCategoryRequest req,
  ) async {
    try {
      final Map<String, dynamic> response = await _dioClient.get(
        '/categories/${req.categoryId}/products',
      );
      return ListProductsByCategoryResponse.fromJson(response);
    } catch (e) {
      if (e is NetworkException) {
        return ListProductsByCategoryResponse.withError(
          e.message ?? 'Có lỗi xảy ra',
        );
      }
      return ListProductsByCategoryResponse.withError(e.toString());
    }
  }
}
