import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:library_app/core/theme/app_colors.dart';
import 'package:library_app/core/theme/app_styles.dart';
import 'package:library_app/core/theme/font_weight_helper.dart';

class MenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback? onMenuSelected;
  final bool isSelected;
  const MenuItem({
    super.key,
    required this.icon,
    required this.title,
    this.onMenuSelected,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60.w,
      height: 130.h,
      //padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
      margin: EdgeInsets.symmetric(horizontal: 6.w, vertical: 4.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            icon: Icon(
              icon,
              color: _getIconColor(),
              size: 20.w,
            ),
            onPressed: onMenuSelected,
          ),
          Text(
            title,
            style: _getTitleStyle(),
            textAlign: TextAlign.center,
          )
        ],
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
