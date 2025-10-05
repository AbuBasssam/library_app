// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_book_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseBookData _$BaseBookDataFromJson(Map<String, dynamic> json) => BaseBookData(
      bookId: (json['bookId'] as num).toInt(),
      title: json['title'] as String,
      author: json['author'] as String,
      coverImageUrl: json['coverImageUrl'] as String,
      isNew: json['isNewBook'] as bool,
    );

Map<String, dynamic> _$BaseBookDataToJson(BaseBookData instance) =>
    <String, dynamic>{
      'bookId': instance.bookId,
      'title': instance.title,
      'author': instance.author,
      'coverImageUrl': instance.coverImageUrl,
      'isNewBook': instance.isNew,
    };
