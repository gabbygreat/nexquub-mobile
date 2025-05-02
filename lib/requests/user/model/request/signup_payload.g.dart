// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignupPayload _$SignupPayloadFromJson(Map<String, dynamic> json) =>
    SignupPayload(
      email: json['email'] as String,
      password: json['password'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      pushToken: json['pushToken'] as String?,
    );

Map<String, dynamic> _$SignupPayloadToJson(SignupPayload instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'pushToken': instance.pushToken,
    };
