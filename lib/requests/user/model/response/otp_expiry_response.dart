import 'package:json_annotation/json_annotation.dart';
import 'package:nexquub/utils/utils.dart';

part 'otp_expiry_response.g.dart';

@JsonSerializable()
class OTPExpiryResponse {
  final int otpExpiry;
  final String email;
  final OTPVerificationType type;

  OTPExpiryResponse({
    required this.otpExpiry,
    required this.email,
    required this.type,
  });

  factory OTPExpiryResponse.fromJson(Map<String, dynamic> json) =>
      _$OTPExpiryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$OTPExpiryResponseToJson(this);
}
