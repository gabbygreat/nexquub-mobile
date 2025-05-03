// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signin_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SigninPayload _$SigninPayloadFromJson(Map<String, dynamic> json) =>
    SigninPayload(
      email: json['email'] as String,
      password: json['password'] as String,
      messagingToken: json['messagingToken'] as String?,
    );

Map<String, dynamic> _$SigninPayloadToJson(SigninPayload instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'messagingToken': instance.messagingToken,
    };
