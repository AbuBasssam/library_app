import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:library_app/core/helpers/spacing.dart';
import 'package:library_app/core/theme/app_styles.dart';

class IconWithTitle extends StatelessWidget {
  final IconData icon;
  final Color? iconColor;
  final Color? backgroundcolor;

  final double? iconSize;
  final String title;
  final TextStyle? titleStyle;
  const IconWithTitle({
    super.key,
    required this.icon,
    this.iconColor,
    required this.title,
    this.titleStyle,
    this.iconSize = 32,
    this.backgroundcolor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          decoration: BoxDecoration(
            color: backgroundcolor,
            shape: BoxShape.circle,
          ),
          child: Icon(icon, size: iconSize?.w, color: iconColor),
        ),
        verticalSpace(16),
        Text(
          title,
          style: titleStyle ?? AppStyles.font15Bold.copyWith(fontSize: 20.sp),
        ),
      ],
    );
  }
}
