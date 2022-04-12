import 'package:fruity/models/product/product.dart';
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
  SaleShockReponseDTO(
      {String? errorMessage, required List<Product> products}) {
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
