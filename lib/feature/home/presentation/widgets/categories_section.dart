import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:library_app/core/helper/spacing.dart';
import 'package:library_app/core/theme/app_styles.dart';
import 'package:library_app/feature/home/domain/entities/book_category.dart';
import 'package:library_app/feature/home/presentation/widgets/book_categories.dart';
import 'package:library_app/generated/locale_keys.g.dart';

class CategoriesSection extends StatelessWidget {
  final List<BookCategory> categories;

  const CategoriesSection({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _sectionTitle(),
          verticalSpace(16),
          BookCategories(categories: categories),
        ],
      ),
    );
  }

  Text _sectionTitle() {
    return Text(
      LocaleKeys.explore_by_categories.tr(),
      style: AppStyles.font24Black87Bold.copyWith(fontSize: 18.sp),
    );
  }
}
