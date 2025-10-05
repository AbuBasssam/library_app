// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiResponse<Type> _$ApiResponseFromJson<Type>(
  Map<String, dynamic> json,
  Type Function(Object? json) fromJsonType,
) =>
    ApiResponse<Type>(
      statusCode: (json['statusCode'] as num).toInt(),
      meta: json['meta'],
      succeeded: json['succeeded'] as bool,
      message: json['message'] as String,
      errors:
          (json['errors'] as List<dynamic>?)?.map((e) => e as String).toList(),
      data: fromJsonType(json['data']),
    );

Map<String, dynamic> _$ApiResponseToJson<Type>(
  ApiResponse<Type> instance,
  Object? Function(Type value) toJsonType,
) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'meta': instance.meta,
      'succeeded': instance.succeeded,
      'message': instance.message,
      'errors': instance.errors,
      'data': toJsonType(instance.data),
    };
