import '../../domain/entities/cover_info.dart';

class AuthorBooksViewInfo {
  final String title;
  final int publishYear;
  final double rating;
  final CoverInfo coverInfo;

  AuthorBooksViewInfo({
    required this.title,
    required this.publishYear,
    required this.rating,
    required this.coverInfo,
  });
}
