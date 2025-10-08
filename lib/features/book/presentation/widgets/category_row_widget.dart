import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:library_app/core/helpers/helper_methods.dart';
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
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
      width: 100.w,
      height: 25.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(color: Colors.blue.withAlpha(77)),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SvgPicture.asset(
            getCategoryIconByName(category),
            width: 20.w,
            height: 20.h,
          ),
          Text(category, style: AppStyles.font14BlueMedium),
        ],
      ),
    );
  }
}
