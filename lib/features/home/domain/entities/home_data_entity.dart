import 'package:library_app/core/helpers/pagination/pagination_response.dart';
import 'package:library_app/features/book/domain/entities/book_entity.dart';
import 'package:library_app/features/home/domain/entities/book_category.dart';

class HomeDataEntity {
  final int notificationCount;
  final List<BookCategory> categories;
  final PaginationResult<BookEntity> categoryBooksSection;
  final List<BookEntity> mostPopularBooksSection;
  final PaginationResult<BookEntity> newestBooksSection;

  HomeDataEntity({
    required this.notificationCount,
    required this.categories,
    required this.categoryBooksSection,
    required this.mostPopularBooksSection,
    required this.newestBooksSection,
  });
}
