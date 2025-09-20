import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/core/helpers/spacing.dart';
import '../../domain/entities/book_category.dart';
import 'book_category_card.dart';

class BookCategories extends StatelessWidget {
  final List<BookCategory> categories;
  const BookCategories({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120.h,
      child: ListView.separated(
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => horizontalSpace(10),
        itemBuilder: (context, index) {
          return BookCategoryCard(
            category: BookCategory(
              id: categories[index].id,
              name: categories[index].name,
            ),
            onTap: () {},
          );
        },
      ),
    );
  }
}
