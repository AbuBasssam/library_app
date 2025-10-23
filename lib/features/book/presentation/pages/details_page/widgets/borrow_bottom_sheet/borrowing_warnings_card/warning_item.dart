import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:library_app/core/theme/app_colors.dart';
import 'package:library_app/core/theme/app_styles.dart';
import 'package:library_app/core/theme/font_weight_helper.dart';

class WarningItem extends StatelessWidget {
  final String text;
  final bool isBold;

  const WarningItem({
    super.key,
    required this.text,
    this.isBold = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '• ',
            style: AppStyles.font14Gray700Regular.copyWith(
              color: AppColors.red800,
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: AppStyles.font14Gray700Regular.copyWith(
                color: AppColors.red800,
                fontSize: 13.sp,
                fontWeight:
                    isBold ? FontWeightHelper.bold : FontWeightHelper.regular,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
