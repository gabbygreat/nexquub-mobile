import 'package:json_annotation/json_annotation.dart';

part 'signin_payload.g.dart';

@JsonSerializable()
class SigninPayload {
  final String email;
  final String password;
  final String? pushToken;

  SigninPayload({required this.email, required this.password, this.pushToken});

  SigninPayload updatePushToken({String? pushToken}) {
    return SigninPayload(
      email: email,
      password: password,
      pushToken: pushToken,
    );
  }

  factory SigninPayload.fromJson(Map<String, dynamic> json) =>
      _$SigninPayloadFromJson(json);

  Map<String, dynamic> toJson() => _$SigninPayloadToJson(this);
}
