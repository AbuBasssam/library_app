import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:library_app/features/book/presentation/models/book_list.dart';

part 'saved_list_bottom_sheet_state.freezed.dart';

@freezed
class SavedListBottomSheetState with _$SavedListBottomSheetState {
  const factory SavedListBottomSheetState.initial() = Initial;

  const factory SavedListBottomSheetState.loading() = Loading;

  const factory SavedListBottomSheetState.empty() = Empty;

  const factory SavedListBottomSheetState.loaded({
    required List<BookListCardModel> bookLists,
    required int selectedIndex,
  }) = Loaded;

  const factory SavedListBottomSheetState.saving() = Saving;

  const factory SavedListBottomSheetState.saveSuccess({
    required String message,
  }) = Success;

  const factory SavedListBottomSheetState.saveError({
    required String error,
  }) = Failure;
}
