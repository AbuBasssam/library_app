import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:library_app/core/helpers/spacing.dart';
import 'package:library_app/core/theme/app_colors.dart';
import 'package:library_app/core/theme/app_styles.dart';
import 'package:library_app/core/theme/font_weight_helper.dart';
import 'package:library_app/core/widgets/icon_with_title.dart';
import 'package:library_app/features/book/presentation/models/borrow_bottom_sheet_info.dart';
import 'package:library_app/generated/locale_keys.g.dart';

class ExtendBorrowBottomSheetHeader extends StatelessWidget {
  final BorrowBottomSheetInfo info;

  const ExtendBorrowBottomSheetHeader({super.key, required this.info});

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
              icon: Icons.update,
              title: LocaleKeys.extend_title.tr(),
              backgroundcolor: AppColors.green50,
              iconSize: 32.w,
              iconColor: AppColors.green600,
            ),
            verticalSpace(8),
            _txtBookTitle(),
            verticalSpace(4),
            _txtBookAuthor(),
          ],
        ),
      ),
    );
  }

  Text _txtBookAuthor() {
    return Text(
      info.bookAuthor,
      style: AppStyles.font12Gray600Regular.copyWith(
        fontSize: 13.sp,
        color: Colors.grey,
      ),
    );
  }

  Text _txtBookTitle() {
    return Text(
      info.bookTitle,
      style: AppStyles.font24Black87Bold.copyWith(
        fontSize: 15.sp,
        fontWeight: FontWeightHelper.semiBold,
      ),
      textAlign: TextAlign.center,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }
}
