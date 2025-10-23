import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:library_app/core/helpers/spacing.dart';
import 'package:library_app/core/theme/app_colors.dart';
import 'package:library_app/core/theme/font_weight_helper.dart';
import 'package:library_app/features/book/presentation/pages/details_page/widgets/borrow_bottom_sheet/predefined_option_card/radio_indicator.dart';
import 'package:library_app/features/book/presentation/pages/details_page/widgets/borrow_bottom_sheet/predefined_option_card/recommended_badge.dart';
import 'package:library_app/generated/locale_keys.g.dart';

/// Displays predefined borrow duration options (10, 18, 30 days)
class PredefinedOptionCard extends StatelessWidget {
  final int days;
  final bool isRecommended;
  final bool isSelected;
  final VoidCallback onTap;

  const PredefinedOptionCard({
    super.key,
    required this.days,
    this.isRecommended = false,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        decoration: _cardDecration(),
        child: Row(
          children: [
            RadioIndicator(isSelected: isSelected),
            horizontalSpace(12),
            Expanded(
              child: Text(
                LocaleKeys.borrow_days_count.tr(
                  namedArgs: {'count': days.toString()},
                ),
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeightHelper.semiBold,
                ),
              ),
            ),
            if (isRecommended) const RecommendedBadge(),
          ],
        ),
      ),
    );
  }

  BoxDecoration _cardDecration() {
    return BoxDecoration(
      color: isSelected ? AppColors.blue50 : Colors.white,
      border: Border.all(
        color: isSelected ? AppColors.blue600 : AppColors.lightGray,
        width: isSelected ? 2.w : 1.w,
      ),
      borderRadius: BorderRadius.circular(12.r),
      boxShadow: isSelected
          ? [
              BoxShadow(
                color: AppColors.blue600.withValues(alpha: 0.1),
                blurRadius: 8.r,
                offset: const Offset(0, 2),
              )
            ]
          : null,
    );
  }
}
