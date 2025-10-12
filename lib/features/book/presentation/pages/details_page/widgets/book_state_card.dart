import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:library_app/core/helpers/spacing.dart';
import 'package:library_app/core/theme/app_styles.dart';

/// Reusable card component for displaying book state information
class BookStateCard extends StatelessWidget {
  final Color backgroundColor;
  final Color borderColor;
  final IconData icon;
  final Color iconColor;
  final String title;
  final Color titleColor;
  final Widget? content;
  final EdgeInsetsGeometry? padding;
  final BorderRadius? borderRadius;
  final List<BoxShadow>? boxShadow;
  final Gradient? gradient;

  const BookStateCard({
    super.key,
    required this.backgroundColor,
    required this.borderColor,
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.titleColor,
    this.content,
    this.padding,
    this.borderRadius,
    this.boxShadow,
    this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          padding ?? EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: gradient == null ? backgroundColor : null,
        gradient: gradient,
        border: Border.all(color: borderColor),
        borderRadius: borderRadius ?? BorderRadius.circular(8.r),
        boxShadow: boxShadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 20.w, color: iconColor),
              horizontalSpace(8),
              Expanded(
                child: Text(
                  title,
                  style: AppStyles.font14SemiBold.copyWith(
                    fontSize: 16.sp,
                    color: titleColor,
                  ),
                ),
              ),
            ],
          ),
          if (content != null) ...[
            verticalSpace(12),
            content!,
          ],
        ],
      ),
    );
  }
}
