import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_data_state.freezed.dart';

@freezed
class HomeDataState with _$HomeDataState {
  const factory HomeDataState.initial() = _Initial;
  const factory HomeDataState.loading() = _Loading;
  const factory HomeDataState.success({required dynamic data}) = _Success;
  const factory HomeDataState.failure({required String message}) = _Failure;
}
