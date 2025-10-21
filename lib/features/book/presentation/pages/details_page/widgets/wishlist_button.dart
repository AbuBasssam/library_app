import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:library_app/core/theme/app_colors.dart';
import 'package:library_app/core/theme/font_weight_helper.dart';
import 'package:library_app/generated/locale_keys.g.dart';

/// Wishlist button component
class WishlistButton extends StatelessWidget {
  final VoidCallback onPressed;
  final bool isExpanded;
  final String? label;

  const WishlistButton({
    super.key,
    required this.onPressed,
    this.isExpanded = true,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: onPressed,
      icon: Icon(
        Icons.bookmark_border,
        size: 20.w,
        color: AppColors.richBlack,
      ),
      label: Text(
        label ?? LocaleKeys.save.tr(),
        style: const TextStyle(fontWeight: FontWeightHelper.semiBold),
      ),
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.blue600,
        padding: EdgeInsets.symmetric(vertical: 12.h),
        side: BorderSide(color: AppColors.blue600, width: 2.w),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r),
        ),
      ),
    );
  }
}
