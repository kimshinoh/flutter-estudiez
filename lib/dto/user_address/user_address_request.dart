import 'package:json_annotation/json_annotation.dart';

part 'user_address_request.g.dart';

@JsonSerializable()
class MyAddressesRequest {
  MyAddressesRequest();

  factory MyAddressesRequest.fromJson(Map<String, dynamic> json) =>
      _$MyAddressesRequestFromJson(json);
  Map<String, dynamic> toJson() => _$MyAddressesRequestToJson(this);
}
