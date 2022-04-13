import 'package:json_annotation/json_annotation.dart';

part 'payment.g.dart';

@JsonSerializable()
class Payment {
  Payment(
      {required this.id,
      required this.userId,
      required this.provider,
      required this.name,
      required this.accountNo,
      required this.status,
      required this.logo});

  factory Payment.fromJson(Map<String, dynamic> json) =>
      _$PaymentFromJson(json);
  Map<String, dynamic> toJson() => _$PaymentToJson(this);

  String id;

  @JsonKey(name: 'user_id')
  String userId;

  String name;
  String provider;
  String status;

  @JsonKey(name: 'account_no')
  String accountNo;

  String logo;
}
