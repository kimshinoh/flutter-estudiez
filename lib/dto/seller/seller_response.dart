import 'package:fruity/models/product/product.dart';
import 'package:fruity/models/seller/seller.dart';
import 'package:json_annotation/json_annotation.dart';

part 'seller_response.g.dart';

@JsonSerializable()
class ListSellerResponse {
  ListSellerResponse({
    required List<Seller> sellers,
    String? errorMessage,
  }) {
    _sellers = sellers;
    _errorMessage = errorMessage;
  }

  factory ListSellerResponse.fromJson(Map<String, dynamic> json) =>
      _$ListSellerResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ListSellerResponseToJson(this);

  factory ListSellerResponse.withError(String errorMessage) {
    return ListSellerResponse(
      errorMessage: errorMessage,
      sellers: [],
    );
  }

  List<Seller> _sellers = [];

  @JsonKey(name: 'message')
  String? _errorMessage;

  List<Seller> get sellers => _sellers;

  String? get errorMessage => _errorMessage;
}

@JsonSerializable(explicitToJson: true)
class SellerResponse {
  SellerResponse({
    Seller? seller,
    String? errorMessage,
  }) {
    _seller = seller;
    _errorMessage = errorMessage;
  }

  factory SellerResponse.fromJson(Map<String, dynamic> json) =>
      _$SellerResponseFromJson(json);
  Map<String, dynamic> toJson() => _$SellerResponseToJson(this);

  factory SellerResponse.withError(String errorMessage) {
    return SellerResponse(
      errorMessage: errorMessage,
    );
  }

  Seller? _seller = null;

  @JsonKey(name: 'message')
  String? _errorMessage;

  Seller? get seller => _seller;

  String? get errorMessage => _errorMessage;
}

@JsonSerializable(explicitToJson: true)
class ListProductsBySellerResponse {
  ListProductsBySellerResponse({
    required List<Product> products,
    String? errorMessage,
  }) {
    _products = products;
    _errorMessage = errorMessage;
  }

  factory ListProductsBySellerResponse.fromJson(Map<String, dynamic> json) =>
      _$ListProductsBySellerResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ListProductsBySellerResponseToJson(this);

  factory ListProductsBySellerResponse.withError(String errorMessage) {
    return ListProductsBySellerResponse(
      errorMessage: errorMessage,
      products: [],
    );
  }

  List<Product> _products = [];

  String? _errorMessage;

  List<Product> get products => _products;

  @JsonKey(name: 'message')
  String? get errorMessage => _errorMessage;
}
