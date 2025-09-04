import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';

class HomeViewBookImageWidget extends StatelessWidget {
  final String coverImage;
  final int frameWidth;
  final int frameHeight;
  final int frameRadius;
  final int imageWidth;
  final int imageHeight;
  final int framePadding;
  final int imageRadius;
  const HomeViewBookImageWidget({
    super.key,
    required this.coverImage,
    this.frameWidth = 160,
    this.frameHeight = 208,
    this.framePadding = 4,
    this.frameRadius = 12,
    this.imageHeight = 200,
    this.imageWidth = 152,
    this.imageRadius = 8,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: frameWidth.w,
      height: frameHeight.h,
      margin: EdgeInsets.symmetric(
        vertical: framePadding.h,
        horizontal: framePadding.w,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(frameRadius.r),
        color: AppColors.white,
        border: Border.all(color: AppColors.lightGray, width: 1.w),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 4.w,
          vertical: 4.h,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(imageRadius.r),
          child: CachedNetworkImage(
            imageUrl: coverImage,
            fit: BoxFit.cover,
            width: imageWidth.w,
            height: imageHeight.h,
          ),
        ),
      ),
    );
  }
}
