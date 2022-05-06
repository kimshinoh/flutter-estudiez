import 'package:dio/dio.dart';
import 'package:fruity/data/network/apis/cateory/category_api.dart';
import 'package:fruity/data/network/dio_client.dart';
import 'package:fruity/dto/category/category_request.dart';
import 'package:fruity/dto/category/category_response.dart';
import 'package:fruity/models/category/category.dart';
import 'package:mobx/mobx.dart';

part 'parent_categories_store.g.dart';

class ParentCategoryStore = _ParentCategoryStoreBase with _$ParentCategoryStore;

abstract class _ParentCategoryStoreBase with Store {
  final CategoryAPI _categoryAPI = CategoryAPI(DioClient(Dio()));

  @observable
  String? categoryId;

  @action
  void setCategoryId(String? categoryId) {
    this.categoryId = categoryId;
  }

  @observable
  List<Category> categories = [];

  @observable
  bool loading = false;

  @observable
  String? errorMessage;

  @action
  Future<void> getCategories() async {
    try {
      loading = true;
      final CategoryListResponse res =
          await _categoryAPI.getParentCategories(CategoryListRequest());

      if (res.errorMessage != null) {
        errorMessage = res.errorMessage;
      } else {
        categories = res.categories;
      }
    } catch (err) {
      errorMessage = err.toString();
    } finally {
      loading = false;
    }
  }
}
