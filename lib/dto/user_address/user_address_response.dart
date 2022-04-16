import 'package:fruity/models/user_address/user_address.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_address_response.g.dart';

@JsonSerializable(explicitToJson: true)
class MyAddressesResponse {
  MyAddressesResponse(
      {String? errorMessage, required List<UserAddress> userAddresses}) {
    _errorMessage = errorMessage;
    _userAddresses = userAddresses;
  }
  List<UserAddress> _userAddresses = [];
  String? _errorMessage;

  @JsonKey(name: 'user_addresses')
  List<UserAddress> get userAddresses => _userAddresses;

  @JsonKey(name: 'message')
  String? get errorMessage => _errorMessage;

  factory MyAddressesResponse.fromJson(Map<String, dynamic> json) =>
      _$MyAddressesResponseFromJson(json);
  Map<String, dynamic> toJson() => _$MyAddressesResponseToJson(this);

  factory MyAddressesResponse.withError(String errorMessage) {
    return MyAddressesResponse(
      userAddresses: [],
      errorMessage: errorMessage,
    );
  }
}
