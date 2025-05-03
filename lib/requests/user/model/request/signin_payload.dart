import 'package:json_annotation/json_annotation.dart';

part 'signin_payload.g.dart';

@JsonSerializable()
class SigninPayload {
  final String email;
  final String password;
  final String? messagingToken;

  SigninPayload({
    required this.email,
    required this.password,
    this.messagingToken,
  });

  SigninPayload updatePushToken({String? messagingToken}) {
    return SigninPayload(
      email: email,
      password: password,
      messagingToken: messagingToken,
    );
  }

  factory SigninPayload.fromJson(Map<String, dynamic> json) =>
      _$SigninPayloadFromJson(json);

  Map<String, dynamic> toJson() => _$SigninPayloadToJson(this);
}
