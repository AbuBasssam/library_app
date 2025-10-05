import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import '../failure.dart';

part 'api_error_model.g.dart';

@JsonSerializable()
class ApiErrorModel extends MyFailure {
  final int? statusCode;
  final List<String>? errors;
  final Object? meta;

  const ApiErrorModel(
      {required super.message, this.statusCode, this.errors, this.meta});

  @override
  String toString() =>
      'ApiException: $message (${statusCode ?? 'no status code'})';

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) {
    return _$ApiErrorModelFromJson(json);
  }
}
