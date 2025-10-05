import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/core/theme/app_colors.dart';
import '/core/theme/app_styles.dart';
import '/core/theme/font_weight_helper.dart';

class TabButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback? onMenuSelected;
  final bool isSelected;

  const TabButton({
    super.key,
    required this.icon,
    required this.title,
    this.onMenuSelected,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60.w,
      height: 130.h,
      child: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 4.h),
          foregroundColor: _getIconColor(),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
        ),
        onPressed: onMenuSelected,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: _getIconColor(),
              size: 20.w,
            ),
            SizedBox(height: 8.h),
            Text(
              title,
              style: _getTitleStyle(),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  TextStyle _getTitleStyle() {
    return isSelected
        ? AppStyles.font12CoolGrayMedium.copyWith(
            fontWeight: FontWeightHelper.semiBold,
            color: AppColors.mainBlue,
          )
        : AppStyles.font12CoolGrayMedium.copyWith(
            fontWeight: FontWeightHelper.semiBold,
          );
  }

  Color _getIconColor() => isSelected ? AppColors.mainBlue : AppColors.coolGray;
}
