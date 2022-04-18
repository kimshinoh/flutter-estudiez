import 'package:json_annotation/json_annotation.dart';

part 'payment_request.g.dart';

@JsonSerializable()
class MyPaymentRequest {
  MyPaymentRequest();

  factory MyPaymentRequest.fromJson(Map<String, dynamic> json) =>
      _$MyPaymentRequestFromJson(json);
  Map<String, dynamic> toJson() => _$MyPaymentRequestToJson(this);
}
