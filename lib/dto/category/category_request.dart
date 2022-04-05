class CategoryListRequest {
  Map<String, dynamic>? query;
  CategoryListRequest({this.query});
}

class ListProductsByCategoryRequest {
  late String categoryId;

  ListProductsByCategoryRequest({required this.categoryId});
}
