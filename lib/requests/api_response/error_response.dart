import 'package:json_annotation/json_annotation.dart';

part 'error_response.g.dart';

@JsonSerializable(genericArgumentFactories: true, createFactory: false)
class ErrorResponse<T> {
  final String message;
  final T? data;
  ErrorResponse({required this.message, this.data});

  factory ErrorResponse.fromJson(
    Map<String, dynamic> json, {
    T Function(Object?)? fromJsonT,
  }) => ErrorResponse<T>(
    message: json['message'] as String,
    data: _$nullableGenericFromJson(json['data'], fromJson: fromJsonT),
  );

  static T? _$nullableGenericFromJson<T>(
    Object? input, {
    T Function(Object? json)? fromJson,
  }) => input == null ? null : fromJson?.call(input);

  Map<String, dynamic> toJson(Object? Function(T) toJsonT) =>
      _$ErrorResponseToJson(this, toJsonT);
}
