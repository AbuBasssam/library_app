import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:library_app/core/helper/spacing.dart';
import 'package:library_app/feature/home/domain/entities/book_category.dart';
import 'package:library_app/feature/home/presentation/widgets/book_categories.dart';
import 'package:library_app/feature/home/presentation/widgets/section_title.dart';
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
          SectionTitle(title: LocaleKeys.explore_by_categories.tr()),
          verticalSpace(16),
          BookCategories(categories: categories),
        ],
      ),
    );
  }
}
