import 'package:library_app/features/book/domain/entities/book_entity.dart';

class BookRecommendations {
  final List<BookEntity> similarBooks;
  final List<BookEntity> relatedBooks;

  const BookRecommendations({
    required this.similarBooks,
    required this.relatedBooks,
  });

  bool get hasRecommendations =>
      similarBooks.isNotEmpty || relatedBooks.isNotEmpty;
}
