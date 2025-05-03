import 'package:json_annotation/json_annotation.dart';
import 'package:nexquub/utils/utils.dart';

part 'otp_expiry_response.g.dart';

@JsonSerializable()
class OTPExpiryResponse {
  final int otpExpiry;
  final String email;
  final String? verificationCode;
  final OTPVerificationType type;

  OTPExpiryResponse({
    required this.otpExpiry,
    required this.email,
    required this.type,
    this.verificationCode,
  });

  OTPExpiryResponse updateVerificationCode({String? code}) {
    return OTPExpiryResponse(
      verificationCode: code,
      otpExpiry: otpExpiry,
      email: email,
      type: type,
    );
  }

  factory OTPExpiryResponse.fromJson(Map<String, dynamic> json) =>
      _$OTPExpiryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$OTPExpiryResponseToJson(this);
}
