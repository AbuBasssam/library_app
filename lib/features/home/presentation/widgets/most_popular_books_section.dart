import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/features/book/domain/entities/book_entity.dart';
import '/core/helper/spacing.dart';
import '/generated/locale_keys.g.dart';
import 'home_book_list.dart';
import 'section_title.dart';

class MostPopularBooksSection extends StatelessWidget {
  final List<BookEntity> books;
  const MostPopularBooksSection({super.key, required this.books});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionTitle(title: LocaleKeys.popular_books.tr()),
          verticalSpace(12),
          SizedBox(
            height: 280.h,
            width: 393.w,
            child: HomeBookList(books: books),
          ),
        ],
      ),
    );
  }
}
