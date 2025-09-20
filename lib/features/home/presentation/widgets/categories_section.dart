import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../domain/entities/book_category.dart';
import '/core/helper/spacing.dart';
import '/generated/locale_keys.g.dart';
import 'book_categories.dart';
import 'section_title.dart';

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
