import 'package:json_annotation/json_annotation.dart';

part 'signup_payload.g.dart';

@JsonSerializable()
class SignupPayload {
  final String email;
  final String password;
  final String firstName;
  final String lastName;
  final String? pushToken;

  SignupPayload({
    required this.email,
    required this.password,
    required this.firstName,
    required this.lastName,
    this.pushToken,
  });

  SignupPayload updatePushToken({String? pushToken}) {
    return SignupPayload(
      email: email,
      password: password,
      firstName: firstName,
      lastName: lastName,
      pushToken: pushToken,
    );
  }

  factory SignupPayload.fromJson(Map<String, dynamic> json) =>
      _$SignupPayloadFromJson(json);

  Map<String, dynamic> toJson() => _$SignupPayloadToJson(this);
}
