// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'other_login_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OtherLoginPayload _$OtherLoginPayloadFromJson(Map<String, dynamic> json) =>
    OtherLoginPayload(
      accessToken: json['access_token'] as String,
      type: $enumDecode(_$SourceTypeEnumMap, json['type']),
      messagingToken: json['messagingToken'] as String?,
    );

Map<String, dynamic> _$OtherLoginPayloadToJson(OtherLoginPayload instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
      'messagingToken': instance.messagingToken,
      'type': _$SourceTypeEnumMap[instance.type]!,
    };

const _$SourceTypeEnumMap = {
  SourceType.google: 'google',
  SourceType.apple: 'apple',
  SourceType.facebook: 'facebook',
};
