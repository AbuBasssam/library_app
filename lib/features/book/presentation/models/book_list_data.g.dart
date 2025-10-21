// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_list_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookListData _$BookListDataFromJson(Map<String, dynamic> json) => BookListData(
      bookId: (json['bookId'] as num).toInt(),
      coverImage: json['coverImage'] as String,
      title: json['title'] as String,
      author: json['author'] as String,
    );

Map<String, dynamic> _$BookListDataToJson(BookListData instance) =>
    <String, dynamic>{
      'bookId': instance.bookId,
      'coverImage': instance.coverImage,
      'title': instance.title,
      'author': instance.author,
    };
