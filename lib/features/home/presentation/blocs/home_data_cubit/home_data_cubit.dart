import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/features/home/domain/use_cases/get_home_data_use_case.dart';
import 'home_data_state.dart';

class HomeDataCubit extends Cubit<HomeDataState> {
  final GetHomeDataUseCase _useCase;
  HomeDataCubit(this._useCase) : super(const HomeDataState.initial());

  Future<void> getHomeData() async {
    emit(const HomeDataState.loading());
    final result = await _useCase.execute();
    return result.fold(
      (error) => emit(HomeDataState.failure(message: error.message)),
      (homeDataEntity) => emit(HomeDataState.success(data: homeDataEntity)),
    );
  }
}
