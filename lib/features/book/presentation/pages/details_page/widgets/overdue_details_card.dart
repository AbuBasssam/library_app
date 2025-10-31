import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:library_app/core/helpers/spacing.dart';
import 'package:library_app/core/theme/app_colors.dart';
import 'package:library_app/core/theme/app_styles.dart';
import 'package:library_app/core/theme/font_weight_helper.dart';

class OverdueDetailsCard extends StatelessWidget {
  final String label;
  final String value;
  final TextStyle? vlueStyle;
  final Color backgroundColor;
  final double valueSize;
  const OverdueDetailsCard({
    super.key,
    required this.label,
    required this.value,
    this.vlueStyle,
    required this.backgroundColor,
    this.valueSize = 16,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(color: AppColors.red300),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: AppStyles.font12Gray600Regular),
          verticalSpace(4),
          Text(
            value,
            style: vlueStyle ??
                TextStyle(
                  fontSize: valueSize.sp,
                  fontWeight: FontWeightHelper.bold,
                  color: AppColors.red600,
                ),
          ),
        ],
      ),
    );
  }
}
