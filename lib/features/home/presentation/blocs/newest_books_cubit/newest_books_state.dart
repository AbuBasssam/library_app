import 'package:freezed_annotation/freezed_annotation.dart';

part 'newest_books_state.freezed.dart';

@freezed
class NewestBooksState with _$NewestBooksState {
  const factory NewestBooksState.initial() = _Initial;
  const factory NewestBooksState.loading() = _Loading;
  const factory NewestBooksState.success({required List<dynamic> books}) =
      _Success;
  const factory NewestBooksState.failure({required String message}) = _Failure;
}
