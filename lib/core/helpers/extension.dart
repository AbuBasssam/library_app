import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:library_app/core/theme/app_colors.dart';
import 'package:library_app/features/book/domain/entities/en_book_state.dart';
import 'package:library_app/generated/locale_keys.g.dart';
import '../../features/book/domain/entities/book_entity.dart';
import '../../features/book/domain/entities/cover_info.dart';
import '../../features/book/presentation/view%20models/detail_view_info.dart';
import '../../features/book/presentation/view%20models/home_view_info.dart';
import '../../features/book/presentation/view%20models/most_search_view_info.dart';
import '../../features/book/presentation/view%20models/similar_books_view_info.dart';
import '../../features/book/presentation/view models/author_book_view_info.dart';
import 'package:lucide_icons/lucide_icons.dart';

extension BookEntityExtensions on BookEntity {
  bool get canMapToCoverInfo => !(imageUrl == null);

  bool get canMapToHomeView =>
      canMapToCoverInfo && !(title == null || author == null);

  bool get canMapToDetailView =>
      canMapToHomeView &&
      !(description == null ||
          state == null ||
          publishYear == null ||
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
    return switch (this) {
      enBookState.borrowable => LocaleKeys.book_state_borrowable.tr(),
      enBookState.borrowed => LocaleKeys.book_state_borrowed.tr(),
      enBookState.reservable => LocaleKeys.book_state_reservable.tr(),
      enBookState.reserved => LocaleKeys.book_state_reserved.tr(),
      enBookState.unavailable => LocaleKeys.book_state_unavailable.tr(),
      enBookState.overdue => LocaleKeys.book_state_overdue.tr()
    };
  }

  Color get backgroundColor {
    return switch (this) {
      enBookState.borrowable => AppColors.green100,
      enBookState.borrowed => AppColors.blue100,
      enBookState.reservable => AppColors.orange100,
      enBookState.reserved => AppColors.yellow100,
      enBookState.unavailable => AppColors.gray100,
      enBookState.overdue => AppColors.red100
    };
  }

  IconData get icon {
    return switch (this) {
      enBookState.borrowable => LucideIcons.checkCircle,
      enBookState.borrowed => Icons.book,
      enBookState.reservable => LucideIcons.users,
      enBookState.reserved => Icons.access_time,
      enBookState.unavailable => Icons.warning,
      enBookState.overdue => Icons.error_outline
    };
  }

  Color get borderColor {
    return switch (this) {
      enBookState.borrowable => AppColors.green200,
      enBookState.borrowed => AppColors.blue200,
      enBookState.reservable => AppColors.orange200,
      enBookState.reserved => AppColors.yellow200,
      enBookState.unavailable => AppColors.gray200,
      enBookState.overdue => AppColors.red200
    };
  }

  Color get textColor {
    return switch (this) {
      enBookState.borrowable => AppColors.green800,
      enBookState.borrowed => AppColors.blue800,
      enBookState.reservable => AppColors.orange800,
      enBookState.reserved => AppColors.yellow800,
      enBookState.unavailable => AppColors.gray800,
      enBookState.overdue => AppColors.red800
    };
  }
}
