import 'package:json_annotation/json_annotation.dart';
part 'api_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class ApiResponse<Type> {
  final int statusCode;
  final String? meta;
  final bool succeeded;
  final String message;
  final List<String>? errors;
  final Type data;

  const ApiResponse({
    required this.statusCode,
    this.meta,
    required this.succeeded,
    required this.message,
    this.errors,
    required this.data,
  });

  /// Converts this instance from JSON.
  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    Type Function(Object? json) fromJsonT,
  ) =>
      _$ApiResponseFromJson(json, fromJsonT);
}
