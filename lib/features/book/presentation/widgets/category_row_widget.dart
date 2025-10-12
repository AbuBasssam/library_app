import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:library_app/core/theme/app_colors.dart';
import 'package:library_app/core/theme/app_styles.dart';

class CategoryRowWidget extends StatelessWidget {
  final String category;
  const CategoryRowWidget({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: AppColors.blue50,
        borderRadius: BorderRadius.circular(6.r),
      ),
      child: Text(
        category,
        style: AppStyles.font14Blue600SemiBold.copyWith(fontSize: 13.sp),
      ),
    );
  }
}
