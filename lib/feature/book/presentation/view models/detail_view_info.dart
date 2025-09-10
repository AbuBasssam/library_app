import 'package:library_app/feature/book/presentation/view%20models/home_view_info.dart';

class DetailViewInfo {
  final HomeViewInfo homeViewInfo;
  final DateTime publishDate;
  final int pagesCount;
  final String publisher;
  final String language;
  final String category;
  final double rating;
  final int readersCount;
  final String isbn;

  DetailViewInfo({
    required this.homeViewInfo,
    required this.publishDate,
    required this.pagesCount,
    required this.publisher,
    required this.language,
    required this.category,
    required this.rating,
    required this.readersCount,
    required this.isbn,
  });
}
