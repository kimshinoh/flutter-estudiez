import 'package:fruity/models/category/category.dart';
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
  String? _errorMessage;

  List<Category> get categories => _categories;

  @JsonKey(name: 'message')
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
