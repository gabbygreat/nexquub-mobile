import 'package:json_annotation/json_annotation.dart';

part 'otp_expiry_response.g.dart';

@JsonSerializable()
class OTPExpiryResponse {
  final int otpExpiry;

  OTPExpiryResponse({required this.otpExpiry});

  factory OTPExpiryResponse.fromJson(Map<String, dynamic> json) =>
      _$OTPExpiryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$OTPExpiryResponseToJson(this);
}
