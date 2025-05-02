import 'package:json_annotation/json_annotation.dart';

part 'other_login_payload.g.dart';

@JsonSerializable()
class OtherLoginPayload {
  OtherLoginPayload({required this.accessToken, required this.type});

  @JsonKey(name: 'access_token')
  final String accessToken;
  final SourceType type;

  factory OtherLoginPayload.fromJson(Map<String, dynamic> json) =>
      _$OtherLoginPayloadFromJson(json);
  Map<String, dynamic> toJson() => _$OtherLoginPayloadToJson(this);
}

@JsonEnum()
enum SourceType { google, facebook, apple }
