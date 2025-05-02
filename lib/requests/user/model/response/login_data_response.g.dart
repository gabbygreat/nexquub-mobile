// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginDataResponse _$LoginDataResponseFromJson(Map<String, dynamic> json) =>
    LoginDataResponse(
      user: UserResponse.fromJson(json['user'] as Map<String, dynamic>),
      token: Token.fromJson(json['token'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginDataResponseToJson(LoginDataResponse instance) =>
    <String, dynamic>{'user': instance.user, 'token': instance.token};

UserResponse _$UserResponseFromJson(Map<String, dynamic> json) => UserResponse(
  id: json['id'] as String,
  email: json['email'] as String,
  registerSource: json['registerSource'] as String,
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$UserResponseToJson(UserResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'registerSource': instance.registerSource,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

Token _$TokenFromJson(Map<String, dynamic> json) => Token(
  type: json['type'] as String,
  name: json['name'] as String?,
  token: json['token'] as String,
  abilities:
      (json['abilities'] as List<dynamic>).map((e) => e as String).toList(),
  lastUsedAt:
      json['lastUsedAt'] == null
          ? null
          : DateTime.parse(json['lastUsedAt'] as String),
  expiresAt:
      json['expiresAt'] == null
          ? null
          : DateTime.parse(json['expiresAt'] as String),
);

Map<String, dynamic> _$TokenToJson(Token instance) => <String, dynamic>{
  'type': instance.type,
  'name': instance.name,
  'token': instance.token,
  'abilities': instance.abilities,
  'lastUsedAt': instance.lastUsedAt?.toIso8601String(),
  'expiresAt': instance.expiresAt?.toIso8601String(),
};
