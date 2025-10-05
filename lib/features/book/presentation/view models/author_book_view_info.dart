import '../../domain/entities/cover_info.dart';

class AuthorBookViewInfo {
  final CoverInfo coverInfo;
  final String title;
  final int publishYear;
  final double rating;

  AuthorBookViewInfo({
    required this.coverInfo,
    required this.title,
    required this.publishYear,
    required this.rating,
  });
}
