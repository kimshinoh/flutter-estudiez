import 'package:json_annotation/json_annotation.dart';

part 'user_address_request.g.dart';

@JsonSerializable()
class MyAddressesRequest {
  MyAddressesRequest();

  factory MyAddressesRequest.fromJson(Map<String, dynamic> json) =>
      _$MyAddressesRequestFromJson(json);
  Map<String, dynamic> toJson() => _$MyAddressesRequestToJson(this);
}

@JsonSerializable()
class CreateUserAddressRequest {
  CreateUserAddressRequest(
      {required this.fullName,
      required this.phoneNumber,
      required this.address,
      required this.latitude,
      required this.longitude,
      required this.isDefault,
      this.note});

  factory CreateUserAddressRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateUserAddressRequestFromJson(json);
  Map<String, dynamic> toJson() => _$CreateUserAddressRequestToJson(this);

  @JsonKey(name: "full_name")
  String fullName;

  @JsonKey(name: "phone_number")
  String phoneNumber;
  String address;
  double latitude;
  double longitude;
  String? note;

  @JsonKey(name: "is_default")
  bool isDefault;
}
