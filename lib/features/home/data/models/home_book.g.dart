// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_book.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeBook _$HomeBookFromJson(Map<String, dynamic> json) => HomeBook(
      bookId: (json['bookId'] as num).toInt(),
      title: json['title'] as String,
      author: json['author'] as String,
      coverImageUrl: json['coverImageUrl'] as String,
      isNew: json['isNew'] as bool,
      isFirstCategory: json['isFirstCategory'] as bool,
      isMostPopular: json['isMostPopular'] as bool,
    );

Map<String, dynamic> _$HomeBookToJson(HomeBook instance) => <String, dynamic>{
      'bookId': instance.bookId,
      'title': instance.title,
      'author': instance.author,
      'coverImageUrl': instance.coverImageUrl,
      'isNew': instance.isNew,
      'isFirstCategory': instance.isFirstCategory,
      'isMostPopular': instance.isMostPopular,
    };
