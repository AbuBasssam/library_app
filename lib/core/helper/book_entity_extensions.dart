import 'package:library_app/feature/book/domain/entities/book_entity.dart';
import 'package:library_app/feature/book/presentation/view%20models/detail_view_info.dart';
import 'package:library_app/feature/book/presentation/view%20models/home_view_info.dart';

extension BookEntityExtensions on BookEntity {
  bool get canMapToCoverInfo => imageUrl != null && isNew != null;

  bool get canMapToHomeView =>
      canMapToCoverInfo && title != null && author != null;

  bool get canMapToDetailView =>
      canMapToHomeView &&
      !(publishDate == null ||
          pagesCount == null ||
          publisher == null ||
          language == null ||
          category == null ||
          rating == null ||
          readersCount == null ||
          isbn == null);

  CoverInfo? get coverInfo {
    if (!canMapToCoverInfo) {
      return null;
      //throw Exception("Missing required fields for CoverInfo");
    }
    return CoverInfo(coverImage: imageUrl!, isNew: isNew!);
  }

  HomeViewInfo? toHomeViewInfo() {
    if (!canMapToHomeView) {
      return null;
      //throw Exception("Missing required fields for HomeViewInfo");
    }
    return HomeViewInfo(
      coverInfo: coverInfo!,
      title: title!,
      author: author!,
    );
  }

  DetailViewInfo? toDetailViewInfo() {
    if (!canMapToDetailView) {
      return null;
      //throw Exception("Missing required fields for DetailViewInfo");
    }

    return DetailViewInfo(
      homeViewInfo: toHomeViewInfo()!,
      publishDate: publishDate!,
      pagesCount: pagesCount!,
      publisher: publisher!,
      language: language!,
      category: category!,
      rating: rating!,
      readersCount: readersCount!,
      isbn: isbn!,
    );
  }
}
