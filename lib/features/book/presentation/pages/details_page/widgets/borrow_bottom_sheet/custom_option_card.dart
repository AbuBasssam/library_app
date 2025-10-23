import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:library_app/core/helpers/spacing.dart';
import 'package:library_app/core/theme/app_colors.dart';
import 'package:library_app/features/book/presentation/pages/details_page/widgets/borrow_bottom_sheet/predefined_option_card/radio_indicator.dart';
import 'package:library_app/generated/locale_keys.g.dart';

/// Custom card specifically for manual/custom input option
class CustomOptionCard extends StatelessWidget {
  final bool isSelected;
  final VoidCallback onTap;

  const CustomOptionCard({
    super.key,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        decoration: BoxDecoration(
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
        ),
        child: Row(
          children: [
            RadioIndicator(isSelected: isSelected),
            horizontalSpace(12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    LocaleKeys.borrow_custom_option_title.tr(),
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  verticalSpace(2),
                  Text(
                    LocaleKeys.borrow_custom_option_description.tr(),
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.tune,
              color: isSelected ? AppColors.blue600 : Colors.grey,
              size: 20.w,
            ),
          ],
        ),
      ),
    );
  }
}
