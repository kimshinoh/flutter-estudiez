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

  @JsonKey(name: 'full_name')
  String fullName;

  @JsonKey(name: 'phone_number')
  String phoneNumber;
  String address;
  double latitude;
  double longitude;
  String? note;

  @JsonKey(name: 'is_default')
  bool isDefault;
}

@JsonSerializable()
class GetUserAddressRequest {
  GetUserAddressRequest(this.id);
  factory GetUserAddressRequest.fromJson(Map<String, dynamic> json) =>
      _$GetUserAddressRequestFromJson(json);
  Map<String, dynamic> toJson() => _$GetUserAddressRequestToJson(this);

  @JsonKey(name: 'id')
  String id;
}

@JsonSerializable()
class UpdateUserAddressRequest {
  UpdateUserAddressRequest(
      {required this.id,
      required this.fullName,
      required this.phoneNumber,
      required this.address,
      required this.latitude,
      required this.longitude,
      required this.isDefault,
      required this.userId,
      this.note});

  factory UpdateUserAddressRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateUserAddressRequestFromJson(json);
  Map<String, dynamic> toJson() => _$UpdateUserAddressRequestToJson(this);

  @JsonKey(name: 'id')
  String id;

  @JsonKey(name: 'full_name')
  String fullName;

  @JsonKey(name: 'phone_number')
  String phoneNumber;
  String address;
  double latitude;
  double longitude;
  String? note;

  @JsonKey(name: 'user_id')
  String userId;

  @JsonKey(name: 'is_default')
  bool isDefault;
}

@JsonSerializable()
class RemoveUserAddressRequest {
  RemoveUserAddressRequest(this.id, this.userId);
  factory RemoveUserAddressRequest.fromJson(Map<String, dynamic> json) =>
      _$RemoveUserAddressRequestFromJson(json);
  Map<String, dynamic> toJson() => _$RemoveUserAddressRequestToJson(this);

  @JsonKey(name: 'id')
  String id;

  @JsonKey(name: 'user_id')
  String userId;
}
