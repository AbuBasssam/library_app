import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:library_app/core/helpers/spacing.dart';
import 'package:library_app/core/theme/app_colors.dart';
import 'package:library_app/core/theme/app_styles.dart';
import 'package:library_app/generated/locale_keys.g.dart';

class RatedWidget extends StatelessWidget {
  final int rating;
  const RatedWidget({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.star, size: 16.w, color: Colors.grey[700]),
            horizontalSpace(8),
            Text(
              LocaleKeys.rate_book_title.tr(),
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.grey[800],
              ),
            ),
          ],
        ),
        verticalSpace(12),
        Row(
          children: [
            Icon(
              Icons.check_circle,
              size: 16.w,
              color: AppColors.green600,
            ),
            horizontalSpace(8),
            Text(
              LocaleKeys.your_rating.tr(),
              style: AppStyles.font14RichBlackRegular.copyWith(
                color: AppColors.green600,
              ),
            ),
          ],
        ),
        verticalSpace(12),
        RatingBarIndicator(
          rating: rating.toDouble(),
          itemSize: 20.w,
          itemPadding: EdgeInsets.symmetric(horizontal: 2.0.w),
          itemBuilder: (context, _) => Icon(
            Icons.star,
            color: AppColors.amberGlow,
          ),
        )
      ],
    );
  }
}
