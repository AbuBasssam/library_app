import 'package:equatable/equatable.dart';
import 'package:library_app/features/book/domain/entities/en_book_state.dart';

class BookEntity extends Equatable {
  final int? id;
  final String? title;
  final String? author;
  final String? imageUrl;
  final bool isNew;
  final String? description;
  final String? publishYear;
  final int? pagesCount;
  final String? isbn;
  final String? publisher;
  final String? language;
  final String? category;
  final double? rating;
  final int? readersCount;
  final enBookState? state;
  final DateTime? searchDate;
  const BookEntity({
    this.id,
    this.title,
    this.author,
    this.imageUrl,
    this.isNew = false,
    this.description,
    this.isbn,
    this.publishYear,
    this.pagesCount,
    this.publisher,
    this.language,
    this.category,
    this.rating,
    this.readersCount,
    this.state,
    this.searchDate,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        author,
        imageUrl,
        isNew,
        description,
        isbn,
        publishYear,
        pagesCount,
        publisher,
        language,
        category,
        rating,
        readersCount,
        searchDate,
      ];
}
