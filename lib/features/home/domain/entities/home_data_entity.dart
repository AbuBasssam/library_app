import 'package:library_app/core/helpers/pagination_response.dart';
import 'package:library_app/features/book/domain/entities/book_entity.dart';

class HomeDataEntity {
  final PaginationResult<BookEntity> newestBooksSection;
  final PaginationResult<BookEntity> categoryBooksSection;
  final List<BookEntity> mostPopularBooksSection;

  HomeDataEntity({
    required this.newestBooksSection,
    required this.categoryBooksSection,
    required this.mostPopularBooksSection,
  });
}
