import 'package:json_annotation/json_annotation.dart';

part 'email_payload.g.dart';

@JsonSerializable()
class EmailPayload {
  final String email;

  EmailPayload({required this.email});

  factory EmailPayload.fromJson(Map<String, dynamic> json) =>
      _$EmailPayloadFromJson(json);

  Map<String, dynamic> toJson() => _$EmailPayloadToJson(this);
}
