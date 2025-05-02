// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reset_password_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResetPasswordPayload _$ResetPasswordPayloadFromJson(
  Map<String, dynamic> json,
) => ResetPasswordPayload(
  email: json['email'] as String,
  newPassword: json['newPassword'] as String,
  verificationCode: json['verificationCode'] as String,
);

Map<String, dynamic> _$ResetPasswordPayloadToJson(
  ResetPasswordPayload instance,
) => <String, dynamic>{
  'email': instance.email,
  'newPassword': instance.newPassword,
  'verificationCode': instance.verificationCode,
};
