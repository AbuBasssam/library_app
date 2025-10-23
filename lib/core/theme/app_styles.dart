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
  static TextStyle font14BlueMedium = TextStyle(
    fontFamily: 'Inter',
    fontSize: 14,
    fontWeight: FontWeightHelper.medium,
    color: Colors.blue.shade500,
  );
  static TextStyle font14GreyRegular = TextStyle(
    fontSize: 14,
    color: Colors.grey,
  );
  static TextStyle font24Black87Bold = TextStyle(
    fontFamily: 'Inter',
    fontSize: 24.sp,
    fontWeight: FontWeightHelper.bold,
    color: Colors.black87,
  );
  static TextStyle font12WhiteBlod = TextStyle(
    color: Colors.white,
    fontWeight: FontWeightHelper.bold,
    fontSize: 12.sp,
  );
  static TextStyle font14RichBlackRegular = TextStyle(
    fontFamily: 'Inter',
    fontSize: 14.sp,
    color: AppColors.richBlack,
    fontWeight: FontWeightHelper.regular,
  );

  static TextStyle font14CoolGrayRegular = TextStyle(
    fontFamily: 'Inter',
    fontSize: 14.sp,
    color: AppColors.coolGray,
    fontWeight: FontWeightHelper.regular,
  );

  static TextStyle font14Gray700Regular = TextStyle(
    fontFamily: 'Inter',
    fontSize: 14.sp,
    color: AppColors.gray700,
    fontWeight: FontWeightHelper.regular,
  );

  // SemiBold 14
  static TextStyle font14Blue600SemiBold = TextStyle(
    fontFamily: 'Inter',
    fontSize: 14.sp,
    color: AppColors.blue600,
    fontWeight: FontWeightHelper.semiBold,
  );

  static TextStyle font14SemiBold = TextStyle(
    fontFamily: 'Inter',
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.semiBold,
  );

  // SemiBold 16
  static TextStyle font16Gray800SemiBold = TextStyle(
    fontFamily: 'Inter',
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.semiBold,
    color: AppColors.gray800,
  );

  static TextStyle font12Gray600Regular = TextStyle(
    fontFamily: 'Inter',
    fontSize: 12.sp,
    color: AppColors.gray600,
    fontWeight: FontWeightHelper.regular,
  );

  // Bold with colors
  static TextStyle font14Red600Bold = TextStyle(
    fontFamily: 'Inter',
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.bold,
    color: AppColors.red600,
  );

  static TextStyle font18Yellow900Bold = TextStyle(
    fontFamily: 'Inter',
    fontSize: 18.sp,
    fontWeight: FontWeightHelper.bold,
    color: AppColors.yellow900,
  );
  static TextStyle font15Bold = TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeightHelper.bold,
  );
}
