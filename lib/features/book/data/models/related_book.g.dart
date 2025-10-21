// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'related_book.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RelatedBook _$RelatedBookFromJson(Map<String, dynamic> json) => RelatedBook(
      bookId: (json['bookId'] as num).toInt(),
      title: json['title'] as String,
      publicationYear: json['publicationYear'].toString(),
      averageRating: (json['averageRating'] as num).toDouble(),
      coverImageUrl: json['coverImageUrl'] as String,
      isNewBook: json['isNewBook'] as bool,
    );

Map<String, dynamic> _$RelatedBookToJson(RelatedBook instance) =>
    <String, dynamic>{
      'bookId': instance.bookId,
      'title': instance.title,
      'publicationYear': instance.publicationYear,
      'averageRating': instance.averageRating,
      'coverImageUrl': instance.coverImageUrl,
      'isNewBook': instance.isNewBook,
    };
