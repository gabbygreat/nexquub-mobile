// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_otp_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyOTPPayload _$VerifyOTPPayloadFromJson(Map<String, dynamic> json) =>
    VerifyOTPPayload(
      email: json['email'] as String,
      verificationCode: json['verificationCode'] as String,
      type: $enumDecode(_$OTPVerificationTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$VerifyOTPPayloadToJson(VerifyOTPPayload instance) =>
    <String, dynamic>{
      'email': instance.email,
      'verificationCode': instance.verificationCode,
      'type': _$OTPVerificationTypeEnumMap[instance.type]!,
    };

const _$OTPVerificationTypeEnumMap = {
  OTPVerificationType.accountCreation: 'accountCreation',
  OTPVerificationType.forgotPassword: 'forgotPassword',
};
