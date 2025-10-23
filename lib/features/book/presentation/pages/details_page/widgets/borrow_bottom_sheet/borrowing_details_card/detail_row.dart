import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:library_app/core/theme/app_styles.dart';
import 'package:library_app/core/theme/font_weight_helper.dart';

class DetailRow extends StatelessWidget {
  final String label;
  final String value;
  final Color? valueColor;

  const DetailRow({
    super.key,
    required this.label,
    required this.value,
    this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontSize: 14.sp, color: Colors.black54)),
          AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 300),
            style: AppStyles.font24Black87Bold.copyWith(
              fontSize: 14.sp,
              fontWeight: FontWeightHelper.semiBold,
              color: valueColor ?? Colors.black87,
            ),
            child: Text(value),
          ),
        ],
      ),
    );
  }
}
