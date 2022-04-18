import 'package:fruity/models/payment/payment.dart';
import 'package:json_annotation/json_annotation.dart';

part 'payment_response.g.dart';

@JsonSerializable()
class MyPaymentsResponse {
  MyPaymentsResponse({required List<Payment> payments, String? message}) {
    _payments = payments;
    _errorMessage = message;
  }

  factory MyPaymentsResponse.fromJson(Map<String, dynamic> json) =>
      _$MyPaymentsResponseFromJson(json);
  Map<String, dynamic> toJson() => _$MyPaymentsResponseToJson(this);

  factory MyPaymentsResponse.withError(String message) =>
      MyPaymentsResponse(message: message, payments: []);

  List<Payment> _payments = [];
  String? _errorMessage;

  List<Payment> get payments => _payments;

  @JsonKey(name: 'message')
  String? get errorMessage => _errorMessage;
}
