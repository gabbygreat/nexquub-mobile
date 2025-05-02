import 'package:json_annotation/json_annotation.dart';

part 'reset_password_payload.g.dart';

@JsonSerializable()
class ResetPasswordPayload {
  final String email;
  final String newPassword;
  final String verificationCode;

  ResetPasswordPayload({
    required this.email,
    required this.newPassword,
    required this.verificationCode,
  });

  factory ResetPasswordPayload.fromJson(Map<String, dynamic> json) =>
      _$ResetPasswordPayloadFromJson(json);

  Map<String, dynamic> toJson() => _$ResetPasswordPayloadToJson(this);
}
