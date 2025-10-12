import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:library_app/core/helpers/spacing.dart';
import 'package:library_app/features/book/domain/entities/book_entity.dart';
import 'package:library_app/features/book/presentation/en_book_card_type.dart';
import 'package:library_app/features/book/presentation/widgets/book_card.dart';
import 'package:library_app/features/home/presentation/widgets/section_title.dart';
import 'package:library_app/generated/locale_keys.g.dart';

class AuthorBookList extends StatelessWidget {
  final List<BookEntity> books;
  const AuthorBookList({super.key, required this.books});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(
          title: LocaleKeys.author_books.tr(namedArgs: {
            'author': books[0].author!,
          }),
        ),
        verticalSpace(12),
        SizedBox(
          height: 280.h,
          width: 393.w,
          child: ListView.separated(
            itemCount: books.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => BookCard(
              model: BookEntity(
                  imageUrl: books[index].imageUrl,
                  isNew: books[index].isNew,
                  title: books[index].title,
                  publishYear: books[index].publishYear,
                  rating: books[index].rating),
              type: enBookCardType.authorBooks,
            ),
            separatorBuilder: (context, index) => horizontalSpace(12),
          ),
        ),
      ],
    );
  }
}
