import 'package:json_annotation/json_annotation.dart';

part 'verify_otp_payload.g.dart';

enum OTPVerificationType {
  @JsonValue('accountCreation')
  accountCreation,

  @JsonValue('forgotPassword')
  forgotPassword,
}

@JsonSerializable()
class VerifyOTPPayload {
  final String email;
  final String verificationCode;
  final OTPVerificationType type;

  VerifyOTPPayload({
    required this.email,
    required this.verificationCode,
    required this.type,
  });

  factory VerifyOTPPayload.fromJson(Map<String, dynamic> json) =>
      _$VerifyOTPPayloadFromJson(json);

  Map<String, dynamic> toJson() => _$VerifyOTPPayloadToJson(this);
}
