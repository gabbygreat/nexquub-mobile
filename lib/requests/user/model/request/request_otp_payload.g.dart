// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_otp_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestOTPPayload _$RequestOTPPayloadFromJson(Map<String, dynamic> json) =>
    RequestOTPPayload(
      email: json['email'] as String,
      type: $enumDecode(_$OTPVerificationTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$RequestOTPPayloadToJson(RequestOTPPayload instance) =>
    <String, dynamic>{
      'email': instance.email,
      'type': _$OTPVerificationTypeEnumMap[instance.type]!,
    };

const _$OTPVerificationTypeEnumMap = {
  OTPVerificationType.accountCreation: 'accountCreation',
  OTPVerificationType.forgotPassword: 'forgotPassword',
};
