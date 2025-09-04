import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:library_app/core/theme/app_colors.dart';
import 'package:library_app/core/theme/font_weight_helper.dart';

class AppStyles {
  AppStyles._();
  static TextStyle font14RichBlackBold = TextStyle(
    fontFamily: 'Inter',
    fontSize: 14.sp,
    color: AppColors.richBlack,
    fontWeight: FontWeightHelper.bold,
  );
  static TextStyle font12CoolGrayMedium = TextStyle(
    fontFamily: 'Inter',
    fontSize: 12.sp,
    color: AppColors.coolGray,
    fontWeight: FontWeightHelper.medium,
  );
  static TextStyle font12whiteRegular = TextStyle(
    fontFamily: 'Inter',
    fontSize: 12.sp,
    color: Colors.white,
    fontWeight: FontWeightHelper.regular,
  );
}
