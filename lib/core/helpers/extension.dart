import 'package:flutter/material.dart';
import 'package:library_app/features/book/domain/entities/en_book_state.dart';

import '../../features/book/domain/entities/book_entity.dart';
import '../../features/book/domain/entities/cover_info.dart';
import '../../features/book/presentation/view%20models/detail_view_info.dart';
import '../../features/book/presentation/view%20models/home_view_info.dart';
import '../../features/book/presentation/view%20models/most_search_view_info.dart';
import '../../features/book/presentation/view%20models/similar_books_view_info.dart';
import '../../features/book/presentation/view models/author_book_view_info.dart';

extension BookEntityExtensions on BookEntity {
  bool get canMapToCoverInfo => !(imageUrl == null); // || isNew == null);

  bool get canMapToHomeView =>
      canMapToCoverInfo && !(title == null || author == null);

  bool get canMapToDetailView =>
      canMapToHomeView &&
      !(publishYear == null ||
          pagesCount == null ||
          publisher == null ||
          language == null ||
          category == null ||
          rating == null ||
          readersCount == null ||
          isbn == null);

  bool get canMapToAuthorView =>
      canMapToCoverInfo &&
      !(title == null || publishYear == null || rating == null);

  bool get canMapToSimilarView =>
      canMapToCoverInfo && !(title == null || author == null || rating == null);

  CoverInfo? get coverInfo {
    if (!canMapToCoverInfo) {
      return null;
    }
    return CoverInfo(coverImage: imageUrl!, isNew: isNew);
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
      publishYear: publishYear!,
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
      publishYear: publishYear!,
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

  MostSearchViewInfo? get mostSearchViewInfo {
    if (!canMapToCoverInfo || title.isNullOrEmpty()) {
      return null;
    }
    return MostSearchViewInfo(
      coverInfo: CoverInfo(coverImage: imageUrl!, isNew: isNew),
      title: title!,
    );
  }
}

extension StringExtension on String? {
  bool isNullOrEmpty() => this == null || this == "";
}

extension BookStateUI on enBookState {
  String get displayText {
    switch (this) {
      case enBookState.borrowable:
        return 'Borrowable';
      case enBookState.borrowed:
        return 'Borrowed';
      case enBookState.reservable:
        return 'قابل للحجز';
      case enBookState.reserved:
        return 'محجوز';
      case enBookState.unavailable:
        return 'غير متاح';
      case enBookState.overdue:
        return 'متأخر';
    }
  }

  Color get backgroundColor {
    switch (this) {
      case enBookState.borrowable:
        return Color(0xFFDCFCE7);
      case enBookState.borrowed:
        return Color(0xFFDBEAFE);
      case enBookState.reservable:
        return Color(0xFFFFEDD5);
      case enBookState.reserved:
        return Color(0xFFFEF9C3);
      case enBookState.unavailable:
        return Color(0xFFF3F4F6);
      case enBookState.overdue:
        return Color(0xFFFEE2E2);
    }
  }

  IconData get icon {
    switch (this) {
      case enBookState.borrowable:
        return Icons.check_circle;
      case enBookState.borrowed:
        return Icons.book;
      case enBookState.reservable:
        return Icons.bookmark_border;
      case enBookState.reserved:
        return Icons.access_time;
      case enBookState.unavailable:
        return Icons.warning;
      case enBookState.overdue:
        return Icons.error_outline;
    }
  }

  Color get borderColor {
    switch (this) {
      case enBookState.borrowable:
        return Color(0xFFBBF7D0);
      case enBookState.borrowed:
        return Color(0xFFBFDBFE);
      case enBookState.reservable:
        return Color(0xFFFED7AA);
      case enBookState.reserved:
        return Color(0xFFFEF08A);
      case enBookState.unavailable:
        return Color(0xFFE5E7EB);
      case enBookState.overdue:
        return Color(0xFFFECACA);
    }
  }

  Color get textColor {
    switch (this) {
      case enBookState.borrowable:
        return Color(0xFF166534);
      case enBookState.borrowed:
        return Color(0xFF1E40AF);
      case enBookState.reservable:
        return Color(0xFF9A3412);
      case enBookState.reserved:
        return Color(0xFF854D0E);
      case enBookState.unavailable:
        return Color(0xFF1F2937);
      case enBookState.overdue:
        return Color(0xFF991B1B);
    }
  }
}
