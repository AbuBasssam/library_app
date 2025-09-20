import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/core/helpers/spacing.dart';
import '../../domain/entities/book_category.dart';
import '/core/theme/app_colors.dart';
import '/core/theme/app_styles.dart';
import 'category_card_icon.dart';

class BookCategoryCard extends StatelessWidget {
  final BookCategory category;
  final VoidCallback? onTap;

  const BookCategoryCard({
    super.key,
    required this.category,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 120.w,
        height: 140.h,
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
        decoration: cardDecoration(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Category Text
            Text(
              category.name,
              style: AppStyles.font14RichBlackBold,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.start,
            ),
            verticalSpace(8),
            CategoryCardIcon(categoryId: category.id),
          ],
        ),
      ),
    );
  }

  BoxDecoration cardDecoration() {
    return BoxDecoration(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(12.r),
      border: Border.all(color: AppColors.lightGray, width: 1.w),
    );
  }
}
