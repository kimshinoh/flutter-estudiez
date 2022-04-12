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
