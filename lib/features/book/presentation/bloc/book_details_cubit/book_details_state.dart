import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:library_app/features/book/data/models/book_details.dart';

part 'book_details_state.freezed.dart';

@freezed
class BookDetailsState with _$BookDetailsState {
  const factory BookDetailsState.initial() = _Initial;
  const factory BookDetailsState.loading() = _Loading;
  const factory BookDetailsState.success({required BookDetailsModel data}) =
      _Success;
  const factory BookDetailsState.failure({required String message}) = _Failure;
}
