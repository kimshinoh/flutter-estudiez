import 'package:json_annotation/json_annotation.dart';

part 'product_request.g.dart';

@JsonSerializable()
class ListProductRequestDTO {
  ListProductRequestDTO({
    required this.limit,
  });

  factory ListProductRequestDTO.fromJson(Map<String, dynamic> json) =>
      _$ListProductRequestDTOFromJson(json);

  Map<String, dynamic> toJson() => _$ListProductRequestDTOToJson(this);

  int limit;
}

@JsonSerializable()
class SaleOffProductRequestDTO {
  SaleOffProductRequestDTO({
    required this.limit,
  });

  factory SaleOffProductRequestDTO.fromJson(Map<String, dynamic> json) =>
      _$SaleOffProductRequestDTOFromJson(json);

  Map<String, dynamic> toJson() => _$SaleOffProductRequestDTOToJson(this);
  int limit;
}

@JsonSerializable()
class SaleShockRequestDTO {
  SaleShockRequestDTO({
    required this.limit,
  });

  factory SaleShockRequestDTO.fromJson(Map<String, dynamic> json) =>
      _$SaleShockRequestDTOFromJson(json);

  Map<String, dynamic> toJson() => _$SaleShockRequestDTOToJson(this);
  int limit;
}
@JsonSerializable()
class SearchProductRequestDTO {
  SearchProductRequestDTO({
    this.limit,
    required this.keyword,
  });

  factory SearchProductRequestDTO.fromJson(Map<String, dynamic> json) =>
      _$SearchProductRequestDTOFromJson(json);

  Map<String, dynamic> toJson() => _$SearchProductRequestDTOToJson(this);
  int? limit;
  String keyword;
}
