import 'package:library_app/feature/book/presentation/view%20models/home_view_info.dart';

class BookEntity {
  final int id;
  final String title;
  final String author;
  final String imageUrl;
  final bool isNew;
  final DateTime? publishDate;
  final int? pagesCount;
  final String? isbn;
  final String? publisher;
  final String? language;
  final String? category;
  final double? rating;
  final int? readersCount;
  final DateTime? searchDate;
  BookEntity({
    required this.id,
    required this.title,
    required this.author,
    required this.imageUrl,
    this.isNew = false,
    this.isbn,
    this.publishDate,
    this.pagesCount,
    this.publisher,
    this.language,
    this.category,
    this.rating,
    this.readersCount,
    this.searchDate,
  });
  CoverInfo get coverInfo => CoverInfo(coverImage: imageUrl, isNew: isNew);
  HomeViewInfo get homeViewInfo {
    return HomeViewInfo(
      coverInfo: coverInfo,
      title: title,
      author: author,
    );
  }
}

class CoverInfo {
  final String coverImage;
  final bool isNew;
  CoverInfo({required this.coverImage, required this.isNew});
}
