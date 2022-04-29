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

@JsonSerializable()
class CreateUserAddressResponse {
  CreateUserAddressResponse({String? errorMessage, UserAddress? userAddress}) {
    _errorMessage = errorMessage;
    _userAddress = userAddress;
  }

  factory CreateUserAddressResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateUserAddressResponseFromJson(json);

  factory CreateUserAddressResponse.withError(String errorMessage) {
    return CreateUserAddressResponse(
      errorMessage: errorMessage,
      userAddress: null,
    );
  }

  Map<String, dynamic> toJson() => _$CreateUserAddressResponseToJson(this);

  UserAddress? _userAddress;
  String? _errorMessage;

  @JsonKey(name: 'message')
  String? get errorMessage => _errorMessage;

  @JsonKey(name: 'user_address')
  UserAddress? get userAddress => userAddress;
}

@JsonSerializable(explicitToJson: true)
class GetUserAddressResponse {
  GetUserAddressResponse({String? errorMessage, UserAddress? userAddress}) {
    _errorMessage = errorMessage;
    _userAddress = userAddress;
  }

  factory GetUserAddressResponse.fromJson(Map<String, dynamic> json) =>
      _$GetUserAddressResponseFromJson(json);

  factory GetUserAddressResponse.withError(String errorMessage) {
    return GetUserAddressResponse(
      errorMessage: errorMessage,
    );
  }

  Map<String, dynamic> toJson() => _$GetUserAddressResponseToJson(this);

  UserAddress? _userAddress;
  String? _errorMessage;

  @JsonKey(name: 'message')
  String? get errorMessage => _errorMessage;

  @JsonKey(name: 'user_address')
  UserAddress? get userAddress => _userAddress;
}

@JsonSerializable()
class UpdateUserAddressResponse {
  UpdateUserAddressResponse({String? errorMessage, UserAddress? userAddress}) {
    _errorMessage = errorMessage;
    _userAddress = userAddress;
  }

  factory UpdateUserAddressResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateUserAddressResponseFromJson(json);

  factory UpdateUserAddressResponse.withError(String errorMessage) {
    return UpdateUserAddressResponse(
      errorMessage: errorMessage,
    );
  }

  Map<String, dynamic> toJson() => _$UpdateUserAddressResponseToJson(this);

  UserAddress? _userAddress;
  String? _errorMessage;

  @JsonKey(name: 'message')
  String? get errorMessage => _errorMessage;

  @JsonKey(name: 'user_address')
  UserAddress? get userAddress => _userAddress;
}

@JsonSerializable()
class RemoveUserAddressResponse {
  RemoveUserAddressResponse({
    String? errorMessage,
  }) {
    _errorMessage = errorMessage;
  }

  factory RemoveUserAddressResponse.fromJson(Map<String, dynamic> json) =>
      _$RemoveUserAddressResponseFromJson(json);

  factory RemoveUserAddressResponse.withError(String errorMessage) {
    return RemoveUserAddressResponse(
      errorMessage: errorMessage,
    );
  }

  Map<String, dynamic> toJson() => _$RemoveUserAddressResponseToJson(this);

  String? _errorMessage;

  @JsonKey(name: 'message')
  String? get errorMessage => _errorMessage;
}
