import 'package:json_annotation/json_annotation.dart';

part 'user_address.g.dart';

@JsonSerializable()
class UserAddress {
  UserAddress(
      {required this.id,
      required this.userId,
      required this.phoneNumber,
      required this.address,
      required this.latitude,
      required this.longitude,
      required this.isDefault,
      required this.fullName,
      this.note});

  factory UserAddress.fromJson(Map<String, dynamic> json) =>
      _$UserAddressFromJson(json);
  Map<String, dynamic> toJson() => _$UserAddressToJson(this);

  String id;

  @JsonKey(name: 'user_id')
  String userId;

  @JsonKey(name: 'is_default')
  bool isDefault;

  @JsonKey(name: 'phone_number')
  String phoneNumber;

  @JsonKey(name: 'full_name')
  String fullName;

  @JsonKey(name: 'address')
  String address;

  double longitude;
  double latitude;
  String? note;
}
