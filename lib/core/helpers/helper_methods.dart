import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/core/helpers/app_strings.dart';
import 'package:library_app/features/book/presentation/bloc/book_details_cubit/book_details_cubit.dart';
import 'package:library_app/features/book/presentation/bloc/saved_list_bottom_sheet_cubit/saved_list_bottom_sheet_cubit.dart';
import 'package:library_app/features/book/presentation/pages/details_page/widgets/saved_list_bottom_sheet/create_list_dialog.dart';

String getCategoryIcon(int categoryId) {
  switch (categoryId) {
    case 1:
      return AppStrings.icRomance;
    case 2:
      return AppStrings.icFantasy;
    case 3:
      return AppStrings.icMystery;
    case 4:
      return AppStrings.icProgramming;
    case 5:
      return AppStrings.icEconomic;
    case 6:
      return AppStrings.icHistory;
    case 7:
      return AppStrings.icScience;
    default:
      return AppStrings.icBook;
  }
}

void showCreateListDialog(BuildContext context) {
  final bsCubit = context.read<SavedListBottomSheetCubit>();
  final bdCubit = context.read<BookDetailsCubit>();
  showDialog(
    context: context,
    builder: (dialogContext) => CreateListDialog(
      bsCubit: bsCubit,
      bdCubit: bdCubit,
    ),
  );
}
