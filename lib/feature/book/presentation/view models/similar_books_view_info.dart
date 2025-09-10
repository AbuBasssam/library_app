import 'package:library_app/feature/book/domain/entities/cover_info.dart';

class SimilarBooksViewInfo {
  final CoverInfo coverInfo;

  final String title;
  final String author;
  final double rating;

  SimilarBooksViewInfo({
    required this.title,
    required this.author,
    required this.rating,
    required this.coverInfo,
  });
}
