// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otp_expiry_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OTPExpiryResponse _$OTPExpiryResponseFromJson(Map<String, dynamic> json) =>
    OTPExpiryResponse(
      otpExpiry: (json['otpExpiry'] as num).toInt(),
      email: json['email'] as String,
      type: $enumDecode(_$OTPVerificationTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$OTPExpiryResponseToJson(OTPExpiryResponse instance) =>
    <String, dynamic>{
      'otpExpiry': instance.otpExpiry,
      'email': instance.email,
      'type': _$OTPVerificationTypeEnumMap[instance.type]!,
    };

const _$OTPVerificationTypeEnumMap = {
  OTPVerificationType.accountCreation: 'accountCreation',
  OTPVerificationType.forgotPassword: 'forgotPassword',
};
