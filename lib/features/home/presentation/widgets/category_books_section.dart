import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:library_app/core/helpers/spacing.dart';
import 'package:library_app/features/home/presentation/blocs/books_by_category_cubit/category_books_cubit.dart';
import '/features/book/domain/entities/book_entity.dart';
import '/features/home/presentation/widgets/home_book_list.dart';
import '/generated/locale_keys.g.dart';
import 'section_title.dart';

class CategoryBooksSection extends StatelessWidget {
  final List<BookEntity> books;
  const CategoryBooksSection({super.key, required this.books});

  @override
  Widget build(BuildContext context) {
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
            child: HomeBookList(
              books: books,
              scrollBehavior: context.read<CategoryBooksCubit>().moveToNextPage,
            ),
          ),
        ],
      ),
    );
  }
}
