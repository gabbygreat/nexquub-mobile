import 'package:json_annotation/json_annotation.dart';
import 'package:nexquub/requests/requests.dart';

part 'request_otp_payload.g.dart';

@JsonSerializable()
class RequestOTPPayload {
  final String email;
  final OTPVerificationType type;

  RequestOTPPayload({required this.email, required this.type});

  factory RequestOTPPayload.fromJson(Map<String, dynamic> json) =>
      _$RequestOTPPayloadFromJson(json);

  Map<String, dynamic> toJson() => _$RequestOTPPayloadToJson(this);
}
