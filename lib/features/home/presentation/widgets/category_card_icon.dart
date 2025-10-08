import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:library_app/core/helpers/helper_methods.dart';
import '/core/theme/app_colors.dart';

class CategoryCardIcon extends StatelessWidget {
  final int categoryId;
  const CategoryCardIcon({super.key, required this.categoryId});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40.w,
      height: 40.h,
      padding: EdgeInsets.all(8.w),
      decoration: BoxDecoration(
        color: AppColors.whiteSmoke,
        borderRadius: BorderRadius.circular(999.r),
      ),
      child: SvgPicture.asset(getCategoryIcon(categoryId)),
    );
  }
}
