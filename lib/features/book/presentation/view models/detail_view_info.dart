import '/features/book/presentation/view%20models/home_view_info.dart';

class DetailViewInfo {
  final HomeViewInfo homeViewInfo;
  final String publishYear;
  final int pagesCount;
  final String publisher;
  final String language;
  final String category;
  final double rating;
  final int readersCount;
  final String isbn;

  DetailViewInfo({
    required this.homeViewInfo,
    required this.publishYear,
    required this.pagesCount,
    required this.publisher,
    required this.language,
    required this.category,
    required this.rating,
    required this.readersCount,
    required this.isbn,
  });
}
