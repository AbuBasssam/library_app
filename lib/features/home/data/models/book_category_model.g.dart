// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookCategoryModel _$BookCategoryModelFromJson(Map<String, dynamic> json) =>
    BookCategoryModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$BookCategoryModelToJson(BookCategoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
