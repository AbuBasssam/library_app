// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'similar_book.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SimilarBook _$SimilarBookFromJson(Map<String, dynamic> json) => SimilarBook(
      bookId: (json['bookId'] as num).toInt(),
      title: json['title'] as String,
      author: json['author'] as String,
      averageRating: (json['averageRating'] as num).toDouble(),
      coverImageUrl: json['coverImageUrl'] as String,
      isNewBook: json['isNewBook'] as bool,
    );

Map<String, dynamic> _$SimilarBookToJson(SimilarBook instance) =>
    <String, dynamic>{
      'bookId': instance.bookId,
      'title': instance.title,
      'author': instance.author,
      'averageRating': instance.averageRating,
      'coverImageUrl': instance.coverImageUrl,
      'isNewBook': instance.isNewBook,
    };
