import 'package:fruity/models/stock/stock.dart';
import 'package:json_annotation/json_annotation.dart';

part 'stock_response.g.dart';

@JsonSerializable()
class GetStockByProductIdResponse {
  GetStockByProductIdResponse({Stock? stock, String? message}) {
    this._stock = stock;
    this._errorMessage = message;
  }

  factory GetStockByProductIdResponse.fromJson(Map<String, dynamic> json) =>
      _$GetStockByProductIdResponseFromJson(json);
  Map<String, dynamic> toJson() => _$GetStockByProductIdResponseToJson(this);

  factory GetStockByProductIdResponse.withError(String message) =>
      GetStockByProductIdResponse(stock: null, message: message);

  Stock? _stock;
  @JsonKey(name: 'stock')
  Stock? get stock => _stock;

  String? _errorMessage;
  @JsonKey(name: 'message')
  String? get errorMessage => _errorMessage;
}
