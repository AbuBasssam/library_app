import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/core/di/dependency_injection.dart';
import 'package:library_app/features/home/domain/use_cases/get_home_data_use_case.dart';
import 'package:library_app/features/home/presentation/blocs/home_data_cubit/home_data_cubit.dart';
import 'package:library_app/features/home/presentation/pages/home_screen.dart';

class HomeScreenBlocBuilder extends StatelessWidget {
  const HomeScreenBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeDataCubit(getIt<GetHomeDataUseCase>()),
      child: HomeScreen(),
    );
  }
}
