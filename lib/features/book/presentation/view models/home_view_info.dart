import '../../domain/entities/cover_info.dart';

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
