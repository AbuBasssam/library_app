// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeData _$HomeDataFromJson(Map<String, dynamic> json) => HomeData(
      notificationCount: (json['notificationCount'] as num).toInt(),
      categories: (json['categories'] as List<dynamic>)
          .map((e) => BookCategoryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      books: (json['books'] as List<dynamic>)
          .map((e) => HomeBook.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HomeDataToJson(HomeData instance) => <String, dynamic>{
      'notificationCount': instance.notificationCount,
      'categories': instance.categories,
      'books': instance.books,
    };
