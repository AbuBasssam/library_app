import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_books_state.freezed.dart';

@freezed
class CategoryBooksState with _$CategoryBooksState {
  const factory CategoryBooksState.initial() = _Initial;
  const factory CategoryBooksState.loading() = _Loading;
  const factory CategoryBooksState.success({required List<dynamic> books}) =
      _Success;
  const factory CategoryBooksState.failure({required String message}) =
      _Failure;
}
