import 'package:json_annotation/json_annotation.dart';

part 'login_data_response.g.dart';

@JsonSerializable()
class LoginDataResponse {
  final UserResponse user;
  final Token token;

  LoginDataResponse({required this.user, required this.token});

  factory LoginDataResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginDataResponseToJson(this);
}

@JsonSerializable()
class UserResponse {
  final String id;
  final String email;
  final String registerSource;
  final DateTime createdAt;
  final DateTime updatedAt;

  UserResponse({
    required this.id,
    required this.email,
    required this.registerSource,
    required this.createdAt,
    required this.updatedAt,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) => _$UserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserResponseToJson(this);
}

@JsonSerializable()
class Token {
  final String type;
  final String? name;
  final String token;
  final List<String> abilities;
  final DateTime? lastUsedAt;
  final DateTime? expiresAt;

  Token({
    required this.type,
    this.name,
    required this.token,
    required this.abilities,
    this.lastUsedAt,
    this.expiresAt,
  });

  factory Token.fromJson(Map<String, dynamic> json) => _$TokenFromJson(json);

  Map<String, dynamic> toJson() => _$TokenToJson(this);
}
