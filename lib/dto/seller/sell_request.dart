import 'package:json_annotation/json_annotation.dart';

part 'sell_request.g.dart';

@JsonSerializable(explicitToJson: true)
class ListSellerRequest {
  ListSellerRequest({this.ids});

  factory ListSellerRequest.fromJson(Map<String, dynamic> json) =>
      _$ListSellerRequestFromJson(json);
  Map<String, dynamic> toJson() => _$ListSellerRequestToJson(this);

  List<String>? ids = [];
}

@JsonSerializable(explicitToJson: true)
class ListProductsBySellerRequest {
  ListProductsBySellerRequest();

  factory ListProductsBySellerRequest.fromJson(Map<String, dynamic> json) =>
      _$ListProductsBySellerRequestFromJson(json);
  Map<String, dynamic> toJson() => _$ListProductsBySellerRequestToJson(this);

  String? sellerId;
}
