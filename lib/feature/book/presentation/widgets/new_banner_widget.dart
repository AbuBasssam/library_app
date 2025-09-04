import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:library_app/core/theme/app_colors.dart';
import 'package:library_app/core/theme/app_styles.dart';
import 'package:library_app/generated/locale_keys.g.dart';

class NewBannerWidget extends StatelessWidget {
  final int borderRadius;
  final int horizontalPadding;
  final int verticalPadding;
  const NewBannerWidget({
    super.key,
    this.borderRadius = 6,
    this.horizontalPadding = 8,
    this.verticalPadding = 4,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 9.h,
      right: 9.w,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding.w,
          vertical: verticalPadding.h,
        ),
        decoration: BoxDecoration(
          color: AppColors.mediumGreen,
          borderRadius: BorderRadius.circular(borderRadius.r),
        ),
        child: Text(
          LocaleKeys.banner_new.tr(),
          style: AppStyles.font12whiteRegular,
        ),
      ),
    );
  }
}
