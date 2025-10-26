import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:library_app/core/theme/app_styles.dart';
import 'package:library_app/core/theme/font_weight_helper.dart';

class NoticeRow extends StatelessWidget {
  final EdgeInsets? padding;
  final String value;
  final Color? valueColor;
  final bool isBold;

  const NoticeRow({
    super.key,
    required this.value,
    this.isBold = false,
    this.valueColor,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.only(bottom: 8.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '• ',
            style: AppStyles.font14Gray700Regular.copyWith(
              color: valueColor,
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: AppStyles.font14Gray700Regular.copyWith(
                color: valueColor,
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
