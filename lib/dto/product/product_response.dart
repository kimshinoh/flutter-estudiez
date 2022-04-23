import 'package:fruity/models/product/product.dart';
import 'package:fruity/models/search/product_search.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_response.g.dart';

@JsonSerializable()
class ListProductsResponseDTO {
  ListProductsResponseDTO(
      {String? errorMessage, required List<Product> products}) {
    _errorMessage = errorMessage;
    _products = products;
  }

  List<Product> _products = [];
  String? _errorMessage;

  List<Product> get products => _products;

  @JsonKey(name: 'message')
  String? get errorMessage => _errorMessage;
  factory ListProductsResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$ListProductsResponseDTOFromJson(json);
  Map<String, dynamic> toJson() => _$ListProductsResponseDTOToJson(this);
  factory ListProductsResponseDTO.withError(String errorMessage) {
    return ListProductsResponseDTO(
      errorMessage: errorMessage,
      products: [],
    );
  }
}

@JsonSerializable()
class SaleOffProductResponseDTO {
  SaleOffProductResponseDTO(
      {String? errorMessage, required List<Product> products}) {
    _errorMessage = errorMessage;
    _products = products;
  }

  List<Product> _products = [];
  String? _errorMessage;

  List<Product> get products => _products;

  @JsonKey(name: 'message')
  String? get errorMessage => _errorMessage;
  factory SaleOffProductResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$SaleOffProductResponseDTOFromJson(json);
  Map<String, dynamic> toJson() => _$SaleOffProductResponseDTOToJson(this);
  factory SaleOffProductResponseDTO.withError(String errorMessage) {
    return SaleOffProductResponseDTO(
      errorMessage: errorMessage,
      products: [],
    );
  }
}

@JsonSerializable()
class SaleShockReponseDTO {
  SaleShockReponseDTO({String? errorMessage, required List<Product> products}) {
    _errorMessage = errorMessage;
    _products = products;
  }

  List<Product> _products = [];
  String? _errorMessage;

  List<Product> get products => _products;

  @JsonKey(name: 'message')
  String? get errorMessage => _errorMessage;
  factory SaleShockReponseDTO.fromJson(Map<String, dynamic> json) =>
      _$SaleShockReponseDTOFromJson(json);
  Map<String, dynamic> toJson() => _$SaleShockReponseDTOToJson(this);
  factory SaleShockReponseDTO.withError(String errorMessage) {
    return SaleShockReponseDTO(
      errorMessage: errorMessage,
      products: [],
    );
  }
}

@JsonSerializable()
class SearchProductResponseDTO {
  SearchProductResponseDTO(
      {String? errorMessage, required ProductSearch productSearch}) {
    _errorMessage = errorMessage;
    _productSearch = productSearch;
  }

  late ProductSearch _productSearch;
  String? _errorMessage;

  ProductSearch get productSearch => _productSearch;

  @JsonKey(name: 'message')
  String? get errorMessage => _errorMessage;
  factory SearchProductResponseDTO.fromJson(Map<String, dynamic> json) =>
      SearchProductResponseDTO(
        errorMessage: json['message'] as String?,
        productSearch: ProductSearch.fromJson(json),
      );
  Map<String, dynamic> toJson() => _$SearchProductResponseDTOToJson(this);
  factory SearchProductResponseDTO.withError(String errorMessage) {
    return SearchProductResponseDTO(
        errorMessage: errorMessage, productSearch: ProductSearch(products: []));
  }
}

@JsonSerializable()
class ProductsByIdsResponseDTO {
  ProductsByIdsResponseDTO({String? errorMessage, required List<Product> products}) {
    _errorMessage = errorMessage;
    _products = products;
  }

  List<Product> _products = [];
  String? _errorMessage;

  List<Product> get products => _products;

  @JsonKey(name: 'message')
  String? get errorMessage => _errorMessage;
  factory ProductsByIdsResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$ProductsByIdsResponseDTOFromJson(json);
  Map<String, dynamic> toJson() => _$ProductsByIdsResponseDTOToJson(this);
  factory ProductsByIdsResponseDTO.withError(String errorMessage) {
    return ProductsByIdsResponseDTO(
      errorMessage: errorMessage,
      products: [],
    );
  }
}