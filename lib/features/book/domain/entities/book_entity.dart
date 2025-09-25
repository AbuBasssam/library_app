import 'package:equatable/equatable.dart';

class BookEntity extends Equatable {
  final int? id;
  final String? title;
  final String? author;
  final String? imageUrl;
  final bool isNew;
  final DateTime? publishDate;
  final int? pagesCount;
  final String? isbn;
  final String? publisher;
  final String? language;
  final String? category;
  final double? rating;
  final int? readersCount;
  final DateTime? searchDate;
  const BookEntity({
    this.id,
    this.title,
    this.author,
    this.imageUrl,
    this.isNew = false,
    this.isbn,
    this.publishDate,
    this.pagesCount,
    this.publisher,
    this.language,
    this.category,
    this.rating,
    this.readersCount,
    this.searchDate,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        author,
        imageUrl,
        isNew,
        isbn,
        publishDate,
        pagesCount,
        publisher,
        language,
        category,
        rating,
        readersCount,
        searchDate,
      ];
}
