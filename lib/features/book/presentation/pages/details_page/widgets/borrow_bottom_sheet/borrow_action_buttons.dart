import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:library_app/core/helpers/spacing.dart';
import 'package:library_app/core/theme/app_colors.dart';
import 'package:library_app/core/theme/app_styles.dart';
import 'package:library_app/core/theme/font_weight_helper.dart';
import 'package:library_app/generated/locale_keys.g.dart';

class BorrowActionButtons extends StatelessWidget {
  final int? selectedDays;
  final void Function(int days) onConfirm;

  const BorrowActionButtons({
    super.key,
    required this.selectedDays,
    required this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 700),
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
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton(
              onPressed: () => Navigator.pop(context),
              style: OutlinedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 14.h),
                side: const BorderSide(color: AppColors.paleGray),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
              child: Text(
                LocaleKeys.cancel.tr(),
                style: AppStyles.font24Black87Bold.copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeightHelper.semiBold,
                ),
              ),
            ),
          ),
          horizontalSpace(12),
          Expanded(
            flex: 2,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              child: ElevatedButton(
                onPressed: selectedDays != null
                    ? () {
                        onConfirm(selectedDays!);
                        Navigator.pop(context);
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.blue600,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 14.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  elevation: selectedDays != null ? 2 : 0,
                  disabledBackgroundColor: Colors.grey[300],
                ),
                child: Text(
                  LocaleKeys.borrow_actions_confirm.tr(),
                  style: AppStyles.font15Bold.copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeightHelper.semiBold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
