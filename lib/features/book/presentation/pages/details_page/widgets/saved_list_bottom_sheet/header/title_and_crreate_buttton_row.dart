import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:library_app/core/theme/app_styles.dart';
import 'package:library_app/features/book/presentation/bloc/saved_list_bottom_sheet_cubit/saved_list_bottom_sheet_cubit.dart';
import 'package:library_app/features/book/presentation/bloc/saved_list_bottom_sheet_cubit/saved_list_bottom_sheet_state.dart';
import 'package:library_app/features/book/presentation/pages/details_page/widgets/saved_list_bottom_sheet/header/create_list_chip.dart';
import 'package:library_app/generated/locale_keys.g.dart';

class TitleAndCrreateButttonRow extends StatelessWidget {
  const TitleAndCrreateButttonRow({super.key});

  @override
  Widget build(BuildContext context) {
    bool hasBookLists =
        context.read<SavedListBottomSheetCubit>().state is! Empty;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(child: _txtTitle()),
        if (hasBookLists) CreateListChip()
      ],
    );
  }

  Text _txtTitle() {
    return Text(
      LocaleKeys.add_to_list.tr(),
      style: AppStyles.font24Black87Bold.copyWith(fontSize: 20.sp),
    );
  }
}
