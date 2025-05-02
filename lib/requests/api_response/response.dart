import 'package:json_annotation/json_annotation.dart';

part 'response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class ApiResponse<T> {
  final String message;
  final T data;
  ApiResponse({required this.message, required this.data});

  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) => _$ApiResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object? Function(T) toJsonT) =>
      _$ApiResponseToJson(this, toJsonT);
}

@JsonSerializable(genericArgumentFactories: true)
class ApiNullResponse<T> {
  final String message;
  final T? data;
  ApiNullResponse({required this.message, required this.data});

  factory ApiNullResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) => _$ApiNullResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object? Function(T) toJsonT) =>
      _$ApiNullResponseToJson(this, toJsonT);
}

@JsonSerializable()
class ApiMessageResponse {
  final String message;
  ApiMessageResponse({required this.message});

  factory ApiMessageResponse.fromJson(Map<String, dynamic> json) =>
      _$ApiMessageResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ApiMessageResponseToJson(this);
}
