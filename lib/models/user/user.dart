import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  User({required this.id, required this.fullName, required this.phoneNumber});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  String id;
  @JsonKey(name: 'full_name')
  String fullName;
  @JsonKey(name: 'phone_number')
  String phoneNumber;
  String? email;
}
