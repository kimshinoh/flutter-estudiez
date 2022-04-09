import 'package:fruity/models/category/category.dart';
import 'package:fruity/models/product/product.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category_response.g.dart';

@JsonSerializable()
class CategoryListResponse {
  CategoryListResponse(
      {String? errorMessage, required List<Category> categories}) {
    _errorMessage = errorMessage;
    _categories = categories;
  }

  List<Category> _categories = [];

  @JsonKey(name: 'message')
  String? _errorMessage;

  List<Category> get categories => _categories;

  String? get errorMessage => _errorMessage;

  factory CategoryListResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoryListResponseFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryListResponseToJson(this);

  factory CategoryListResponse.withError(String errorMessage) {
    return CategoryListResponse(
      errorMessage: errorMessage,
      categories: [],
    );
  }
}

@JsonSerializable(
  explicitToJson: true,
)
class ListProductsByCategoryResponse {
  ListProductsByCategoryResponse(
      {String? errorMessage, required List<Product> products}) {
    _errorMessage = errorMessage;
    _products = products;
  }

  List<Product> _products = [];
  String? _errorMessage;

  List<Product> get products => _products;

  @JsonKey(name: 'message')
  String? get errorMessage => _errorMessage;

  factory ListProductsByCategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$ListProductsByCategoryResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ListProductsByCategoryResponseToJson(this);

  factory ListProductsByCategoryResponse.withError(String errorMessage) {
    return ListProductsByCategoryResponse(
      errorMessage: errorMessage,
      products: [],
    );
  }
}
