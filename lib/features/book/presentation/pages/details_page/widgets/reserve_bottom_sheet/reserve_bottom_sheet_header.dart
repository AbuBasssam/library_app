import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:library_app/core/helpers/spacing.dart';
import 'package:library_app/core/theme/app_colors.dart';
import 'package:library_app/core/theme/app_styles.dart';
import 'package:library_app/core/widgets/book_author_text.dart';
import 'package:library_app/core/widgets/book_title_text.dart';
import 'package:library_app/core/widgets/icon_with_title.dart';
import 'package:library_app/features/book/presentation/models/borrow_bottom_sheet_info.dart';
import 'package:library_app/generated/locale_keys.g.dart';

class ReserveBottomSheetHeader extends StatelessWidget {
  final BorrowBottomSheetInfo info;
  const ReserveBottomSheetHeader({super.key, required this.info});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 400),
      tween: Tween(begin: 0.0, end: 1.0),
      curve: Curves.easeOutCubic,
      builder: (context, value, child) {
        return Transform.scale(
          scale: 0.8 + (0.2 * value),
          child: Opacity(
            opacity: value,
            child: child,
          ),
        );
      },
      child: Center(
        child: Column(
          children: [
            IconWithTitle(
              icon: Icons.menu_book,
              title: LocaleKeys.reserve_title.tr(),
              backgroundcolor: AppColors.orange50,
              iconColor: AppColors.orange600,
              titleStyle: AppStyles.font15Bold.copyWith(fontSize: 20.sp),
            ),
            verticalSpace(8),
            BookTitleText(vlaue: info.bookTitle),
            verticalSpace(4),
            BookAuthorText(vlaue: info.bookAuthor)
          ],
        ),
      ),
    );
  }
}
