import 'package:library_app/features/book/data/models/related_book.dart';
import 'package:library_app/features/book/data/models/similar_book.dart';
import 'package:library_app/features/book/domain/entities/en_book_state.dart';
import 'package:json_annotation/json_annotation.dart';

part 'book_details.g.dart';

@JsonSerializable(explicitToJson: true)
class BookDetailsModel {
  final int bookId;
  final String title;
  final String author;
  final String description;
  final String isbn;
  final enBookState bookState;
  final String coverImageUrl;
  final bool isNewBook;
  final String publisher;
  final String publicationYear;
  final int pages;
  final String language;
  final String category;
  final double averageRating;
  final int userRating;
  final int totalReaders;
  final List<SimilarBook> similarBooks;
  final List<RelatedBook> relatedBooks;

  const BookDetailsModel({
    required this.bookId,
    required this.title,
    required this.author,
    required this.description,
    required this.isbn,
    required this.bookState,
    required this.coverImageUrl,
    required this.isNewBook,
    required this.publisher,
    required this.publicationYear,
    required this.pages,
    required this.language,
    required this.category,
    required this.averageRating,
    required this.userRating,
    required this.totalReaders,
    required this.similarBooks,
    required this.relatedBooks,
  });

  factory BookDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$BookDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$BookDetailsModelToJson(this);
}
