import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:library_app/core/helper/spacing.dart';
import 'package:library_app/core/theme/app_colors.dart';
import 'package:library_app/core/theme/app_styles.dart';
import 'package:library_app/feature/home/domain/entities/book_category.dart';
import 'package:library_app/feature/home/presentation/widgets/category_card_icon.dart';

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
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100.w,
        height: 120.h,
        padding: EdgeInsets.all(14.w),
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
