// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookDetailsModel _$BookDetailsModelFromJson(Map<String, dynamic> json) =>
    BookDetailsModel(
      bookId: (json['bookId'] as num).toInt(),
      title: json['title'] as String,
      author: json['author'] as String,
      description: json['description'] as String,
      isbn: json['isbn'] as String,
      bookState: $enumDecode(_$enBookStateEnumMap, json['bookState']),
      coverImageUrl: json['coverImageUrl'] as String,
      isNewBook: json['isNewBook'] as bool,
      publisher: json['publisher'] as String,
      publicationYear: json['publicationYear'] as String,
      pages: (json['pages'] as num).toInt(),
      language: json['language'] as String,
      category: json['category'] as String,
      averageRating: (json['averageRating'] as num).toDouble(),
      userRating: (json['userRating'] as num).toInt(),
      totalReaders: (json['totalReaders'] as num).toInt(),
      similarBooks: (json['similarBooks'] as List<dynamic>)
          .map((e) => SimilarBook.fromJson(e as Map<String, dynamic>))
          .toList(),
      relatedBooks: (json['relatedBooks'] as List<dynamic>)
          .map((e) => RelatedBook.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BookDetailsModelToJson(BookDetailsModel instance) =>
    <String, dynamic>{
      'bookId': instance.bookId,
      'title': instance.title,
      'author': instance.author,
      'description': instance.description,
      'isbn': instance.isbn,
      'bookState': _$enBookStateEnumMap[instance.bookState]!,
      'coverImageUrl': instance.coverImageUrl,
      'isNewBook': instance.isNewBook,
      'publisher': instance.publisher,
      'publicationYear': instance.publicationYear,
      'pages': instance.pages,
      'language': instance.language,
      'category': instance.category,
      'averageRating': instance.averageRating,
      'userRating': instance.userRating,
      'totalReaders': instance.totalReaders,
      'similarBooks': instance.similarBooks.map((e) => e.toJson()).toList(),
      'relatedBooks': instance.relatedBooks.map((e) => e.toJson()).toList(),
    };

const _$enBookStateEnumMap = {
  enBookState.borrowable: 1,
  enBookState.borrowed: 2,
  enBookState.reservable: 3,
  enBookState.reserved: 4,
  enBookState.unavailable: 5,
  enBookState.overdue: 6,
};
