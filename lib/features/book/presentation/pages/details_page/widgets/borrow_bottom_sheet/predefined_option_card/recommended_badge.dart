import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:library_app/core/theme/app_colors.dart';
import 'package:library_app/core/theme/app_styles.dart';
import 'package:library_app/generated/locale_keys.g.dart';

class RecommendedBadge extends StatelessWidget {
  const RecommendedBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: AppColors.green100,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Text(
        LocaleKeys.borrow_recommended.tr(),
        style: AppStyles.font16Gray800SemiBold.copyWith(
          fontSize: 11.sp,
          color: AppColors.green800,
        ),
      ),
    );
  }
}
