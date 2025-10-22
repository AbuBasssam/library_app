import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:library_app/features/book/domain/entities/book_entity.dart';
import 'package:library_app/features/book/domain/entities/book_recommendations.dart';
import 'package:library_app/features/book/domain/entities/book_status.dart';
import 'package:library_app/features/book/domain/entities/user_book_preference.dart';

part 'book_details_state.freezed.dart';

@freezed
class BookDetailsState with _$BookDetailsState {
  const factory BookDetailsState.initial() = _Initial;
  const factory BookDetailsState.loading() = _Loading;
  const factory BookDetailsState.success({
    required BookEntity bookDetails,
    required BookStatus bookStatus,
    required UserBookPreference userPreference,
    required BookRecommendations recommendations,
  }) = Success;
  const factory BookDetailsState.failure({required String message}) = _Failure;
}
