import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/core/helper/spacing.dart';
import '/features/book/domain/entities/book_entity.dart';
import '/features/home/presentation/widgets/home_book_list.dart';
import '/generated/locale_keys.g.dart';
import 'section_title.dart';

class CategoryBooksSection extends StatelessWidget {
  final List<BookEntity> books;
  const CategoryBooksSection({super.key, required this.books});

  @override
  Widget build(BuildContext context) {
    List<BookEntity> books = <BookEntity>[
      BookEntity(
        imageUrl: 'https://picsum.photos/160/202',
        isNew: true,
        title: 'Atomic Habits',
        author: 'James Clear',
      ),
      BookEntity(
        imageUrl: 'https://picsum.photos/160/202',
        isNew: false,
        title: 'The Subtle Art of Not Giving a F*ck',
        author: 'Mark Manson',
      ),
      BookEntity(
        imageUrl: 'https://picsum.photos/160/202',
        isNew: true,
        title: 'Deep Work',
        author: 'Cal Newport',
      ),
      BookEntity(
        imageUrl: 'https://picsum.photos/160/202',
        isNew: false,
        title: 'Thinking, Fast and Slow',
        author: 'Daniel Kahneman',
      ),
      BookEntity(
        imageUrl: 'https://picsum.photos/160/202',
        isNew: true,
        title: 'Grit',
        author: 'Angela Duckworth',
      ),
    ];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionTitle(title: LocaleKeys.Recommended.tr()),
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
