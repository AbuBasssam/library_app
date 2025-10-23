import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:library_app/core/helpers/spacing.dart';
import 'package:library_app/core/theme/app_colors.dart';
import 'package:library_app/core/theme/app_styles.dart';
import 'package:library_app/features/book/presentation/pages/details_page/widgets/borrow_bottom_sheet/borrowing_warnings_card/warning_item.dart';
import 'package:library_app/generated/locale_keys.g.dart';

/// Displays important borrowing warnings
class BorrowingWarningsCard extends StatelessWidget {
  final int pickupRequiredHours;
  final double finePerDay;

  const BorrowingWarningsCard({
    super.key,
    required this.pickupRequiredHours,
    required this.finePerDay,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 600),
      tween: Tween(begin: 0.0, end: 1.0),
      curve: Curves.easeOutCubic,
      builder: (context, value, child) {
        return Transform.translate(
          offset: Offset(0, 20 * (1 - value)),
          child: Opacity(
            opacity: value,
            child: child,
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        decoration: _cardDecoration(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title Row
            Row(children: [_icoWarning(), horizontalSpace(8), _txtTitle()]),

            verticalSpace(12),

            // pickup time
            WarningItem(
              text: LocaleKeys.borrow_warnings_pickup.tr(
                namedArgs: {'hours': pickupRequiredHours.toString()},
              ),
              isBold: true,
            ),

            //daily fine amount
            WarningItem(
              text: LocaleKeys.borrow_warnings_fine.tr(
                namedArgs: {'amount': finePerDay.toStringAsFixed(0)},
              ),
              isBold: true,
            ),

            //waning note
            WarningItem(text: LocaleKeys.borrow_warnings_auto_charge.tr()),
          ],
        ),
      ),
    );
  }

  BoxDecoration _cardDecoration() {
    return BoxDecoration(
      color: AppColors.red100,
      border: Border.all(color: AppColors.red200),
      borderRadius: BorderRadius.circular(12.r),
    );
  }

  Text _txtTitle() {
    return Text(
      LocaleKeys.borrow_warnings_important_info.tr(),
      style: AppStyles.font14RichBlackBold.copyWith(
        fontSize: 15.sp,
        color: AppColors.red800,
      ),
    );
  }

  Icon _icoWarning() {
    return Icon(Icons.warning_amber, size: 20.w, color: AppColors.red800);
  }
}
