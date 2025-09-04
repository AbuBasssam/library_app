import '/feature/book/domain/entities/book_entity.dart';

class HomeViewInfo {
  final String title;
  final String author;
  final CoverInfo coverInfo;

  HomeViewInfo({
    required this.coverInfo,
    required this.title,
    required this.author,
  });
}
