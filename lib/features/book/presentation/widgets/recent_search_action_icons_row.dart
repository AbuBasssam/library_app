import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:library_app/core/helpers/spacing.dart';
import 'package:library_app/core/theme/app_colors.dart';

class RecentSearchActionIconsRow extends StatelessWidget {
  const RecentSearchActionIconsRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.bookmark_border, // Icons.bookmark_outlined
          color: AppColors.coolGray,
          size: 20.sp,
        ),
        horizontalSpace(8),
        // Remove Icon
        Icon(
          Icons.close,
          color: AppColors.coolGray,
          size: 20.sp,
        ),
      ],
    );
  }
}
