import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
      child: SvgPicture.asset(_getCategoryIcon(categoryId)),
    );
  }

  String _getCategoryIcon(int categoryId) {
    switch (categoryId) {
      case 1:
        return 'assets/svgs/Romance.svg'; // Romance
      case 2:
        return 'assets/svgs/Fantasy.svg'; // Fantasy
      case 3:
        return 'assets/svgs/Mystery.svg'; // Mystery
      case 4:
        return 'assets/svgs/Programming.svg'; // Programming
      case 5:
        return 'assets/svgs/Economic.svg'; // Economics
      case 6:
        return 'assets/svgs/History.svg'; // History
      case 7:
        return 'assets/svgs/Science.svg'; // Science

      default:
        return 'assets/svgs/Book.svg'; // Default icon
    }
  }
}
