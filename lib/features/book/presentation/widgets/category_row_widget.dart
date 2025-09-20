import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:library_app/core/helper/spacing.dart';
import 'package:library_app/core/theme/app_styles.dart';

class CategoryRowWidget extends StatelessWidget {
  final IconData icon;
  final String categoryName;
  const CategoryRowWidget({
    super.key,
    required this.icon,
    required this.categoryName,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
          width: 100.w,
          height: 25.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            boxShadow: [
              BoxShadow(color: Colors.blue.withAlpha(77)),
            ],
          ),
          child: Row(
            children: [
              Icon(Icons.science, size: 22),
              horizontalSpace(4),
              Text(categoryName, style: AppStyles.font14BlueMedium),
            ],
          ),
        ),
      ],
    );
  }
}
