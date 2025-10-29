import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:library_app/core/theme/app_styles.dart';
import 'package:library_app/core/theme/font_weight_helper.dart';

class BookTitleText extends StatelessWidget {
  final String vlaue;

  const BookTitleText({
    super.key,
    required this.vlaue,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      vlaue,
      style: AppStyles.font24Black87Bold.copyWith(
        fontSize: 15.sp,
        fontWeight: FontWeightHelper.semiBold,
      ),
      textAlign: TextAlign.center,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }
}
