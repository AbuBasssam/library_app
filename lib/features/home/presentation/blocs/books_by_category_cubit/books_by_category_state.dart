import 'package:freezed_annotation/freezed_annotation.dart';

part 'books_by_category_state.freezed.dart';

@freezed
class BooksByCategoryState with _$BooksByCategoryState {
  const factory BooksByCategoryState.initial() = _Initial;
  const factory BooksByCategoryState.loading() = _Loading;
  const factory BooksByCategoryState.success({required List<dynamic> books}) =
      _Success;
  const factory BooksByCategoryState.failure({required String message}) =
      _Failure;
}
