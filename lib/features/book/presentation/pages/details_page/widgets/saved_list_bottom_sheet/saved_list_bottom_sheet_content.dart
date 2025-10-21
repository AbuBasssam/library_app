import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:library_app/features/book/presentation/bloc/saved_list_bottom_sheet_cubit/saved_list_bottom_sheet_cubit.dart';
import 'package:library_app/features/book/presentation/bloc/saved_list_bottom_sheet_cubit/saved_list_bottom_sheet_state.dart';
import 'package:library_app/features/book/presentation/pages/details_page/widgets/saved_list_bottom_sheet/body/content_status/saved_list_bottom_sheet_book_lists.dart';
import 'package:library_app/features/book/presentation/pages/details_page/widgets/saved_list_bottom_sheet/body/empty_status/saved_list_bottom_sheet_empty_content.dart';

class SavedListBottomSheetContent extends StatelessWidget {
  final SavedListBottomSheetState state;

  const SavedListBottomSheetContent({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return state.when(
      initial: () => const SizedBox.shrink(),
      loading: () => Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 48.0.w, vertical: 48.0.h),
          child: CircularProgressIndicator(),
        ),
      ),
      empty: () => SavedListBottomSheetEmptyContent(),
      loaded: (bookLists, selectedIndex) => SavedListBottomSheetBookLists(
        content: bookLists,
        selectedIndex: selectedIndex,
        onSelectList: (index) {
          context.read<SavedListBottomSheetCubit>().selectList(index);
        },
      ),
      saving: () => Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 48.0.w, vertical: 48.0.h),
          child: CircularProgressIndicator(),
        ),
      ),
      saveSuccess: (_) => const SizedBox.shrink(),
      saveError: (_) => const SizedBox.shrink(),
    );
  }
}
