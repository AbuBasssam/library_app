import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:library_app/core/helpers/spacing.dart';
import 'package:library_app/features/book/presentation/pages/details_page/widgets/saved_list_bottom_sheet/body/empty_status/animated_book_icon.dart';
import 'package:library_app/features/book/presentation/pages/details_page/widgets/saved_list_bottom_sheet/body/empty_status/create_list_button.dart';
import 'package:library_app/features/book/presentation/pages/details_page/widgets/saved_list_bottom_sheet/body/empty_status/empty_list_description.dart';
import 'package:library_app/features/book/presentation/pages/details_page/widgets/saved_list_bottom_sheet/body/empty_status/empty_list_title.dart';

class SavedListBottomSheetEmptyContent extends StatelessWidget {
  final VoidCallback? onCreateNewList;
  const SavedListBottomSheetEmptyContent({this.onCreateNewList, super.key});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeOut,
      builder: (context, value, child) {
        return Transform.translate(
          offset: Offset(0, (20 * (1 - value)).h),
          child: Opacity(opacity: value, child: child),
        );
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 32.h, vertical: 48.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedBookIcon(),
            verticalSpace(24),
            EmptyListTitle(),
            verticalSpace(12),
            EmptyListDescription(),
            verticalSpace(32),
            CreateListButton(onPressed: onCreateNewList),
          ],
        ),
      ),
    );
  }
}
