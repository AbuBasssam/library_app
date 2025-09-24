// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookCategoryModel _$BookCategoryModelFromJson(Map<String, dynamic> json) =>
    BookCategoryModel(
      categoryId: (json['categoryId'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$BookCategoryModelToJson(BookCategoryModel instance) =>
    <String, dynamic>{
      'categoryId': instance.categoryId,
      'name': instance.name,
    };
