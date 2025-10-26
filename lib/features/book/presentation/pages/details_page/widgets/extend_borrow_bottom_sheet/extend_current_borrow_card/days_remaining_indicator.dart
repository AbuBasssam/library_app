import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:library_app/core/helpers/spacing.dart';
import 'package:library_app/core/theme/app_colors.dart';
import 'package:library_app/core/theme/app_styles.dart';
import 'package:library_app/generated/locale_keys.g.dart';

class DaysRemainingIndicator extends StatelessWidget {
  final bool isUrgent;
  final int daysRemaining;
  const DaysRemainingIndicator({
    super.key,
    required this.isUrgent,
    required this.daysRemaining,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      decoration: _decoration(),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            isUrgent ? Icons.warning_amber : Icons.schedule,
            size: 18.w,
            color: isUrgent ? AppColors.red600 : AppColors.orange600,
          ),
          horizontalSpace(6),
          Text(
            LocaleKeys.extend_days_remaining.tr(
              namedArgs: {'count': daysRemaining.toString()},
            ),
            style: AppStyles.font15Bold.copyWith(
              fontSize: 13.sp,
              color: isUrgent ? AppColors.red800 : AppColors.orange800,
            ),
          ),
        ],
      ),
    );
  }

  BoxDecoration _decoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(8.r),
      color: isUrgent ? AppColors.red50 : AppColors.orange50,
      border: Border.all(
        color: isUrgent ? AppColors.red200 : AppColors.orange200,
      ),
    );
  }
}
