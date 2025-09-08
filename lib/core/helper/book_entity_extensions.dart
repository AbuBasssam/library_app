import 'package:library_app/feature/book/domain/entities/book_entity.dart';
import 'package:library_app/feature/book/domain/entities/cover_info.dart';
import 'package:library_app/feature/book/presentation/view%20models/detail_view_info.dart';
import 'package:library_app/feature/book/presentation/view%20models/home_view_info.dart';
import 'package:library_app/feature/book/presentation/view%20models/similar_books_view_info.dart';
import '../../feature/book/presentation/view models/author_book_view_info.dart';

extension BookEntityExtensions on BookEntity {
  bool get canMapToCoverInfo => !(imageUrl == null || isNew == null);

  bool get canMapToHomeView =>
      canMapToCoverInfo && !(title == null || author == null);

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

  bool get canMapToAuthorView =>
      canMapToCoverInfo &&
      !(title == null || publishDate == null || rating == null);

  bool get canMapToSimilarView =>
      canMapToCoverInfo && !(title == null || author == null || rating == null);

  CoverInfo? get coverInfo {
    if (!canMapToCoverInfo) {
      return null;
    }
    return CoverInfo(coverImage: imageUrl!, isNew: isNew!);
  }

  HomeViewInfo? toHomeViewInfo() {
    if (!canMapToHomeView) {
      return null;
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

  AuthorBookViewInfo? toAuthorBooksViewInfo() {
    if (!canMapToAuthorView) {
      return null;
    }

    return AuthorBookViewInfo(
      title: title!,
      publishYear: publishDate!.year,
      rating: rating!,
      coverInfo: coverInfo!,
    );
  }

  SimilarBooksViewInfo? toSimilarBookViewInfo() {
    if (!canMapToSimilarView) {
      return null;
    }

    return SimilarBooksViewInfo(
      coverInfo: coverInfo!,
      author: author!,
      title: title!,
      rating: rating!,
    );
  }
}
