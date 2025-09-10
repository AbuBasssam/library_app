import 'package:flutter/material.dart';
import 'package:library_app/core/helper/spacing.dart';
import 'package:library_app/core/theme/app_styles.dart';
import 'package:library_app/feature/book/domain/entities/book_info.dart';
import 'package:library_app/feature/book/presentation/widgets/category_row_widget.dart';
import 'package:library_app/feature/book/presentation/widgets/detail_row.dart';
import 'package:library_app/feature/book/presentation/widgets/ratintg_row_widget.dart';
import 'package:library_app/generated/locale_keys.g.dart';

class BookInfoWidget extends StatelessWidget {
  final BookInfo info;
  final IconData categoryIcon;
  const BookInfoWidget({
    super.key,
    required this.info,
    required this.categoryIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          info.title,
          style: AppStyles.font24Black87Bold,
        ),
        verticalSpace(8),
        DetailRow(
          detailIcon: Icons.person,
          strDetail: info.author,
        ),
        verticalSpace(4),
        DetailRow(
          detailIcon: Icons.calendar_today,
          strDetail: '${info.publishYear}',
        ),
        verticalSpace(4),
        DetailRow(
          detailIcon: Icons.menu_book_rounded,
          strDetail: '${info.pagesCount} ${LocaleKeys.Pages}',
        ),
        verticalSpace(4),
        DetailRow(
          detailIcon: Icons.business,
          strDetail: info.publisher,
        ),
        verticalSpace(4),
        DetailRow(
          detailIcon: Icons.numbers,
          strDetail: info.isbn,
        ),
        verticalSpace(4),
        DetailRow(
          detailIcon: Icons.language,
          strDetail: info.language,
        ),
        verticalSpace(4),
        CategoryRowWidget(
          icon: categoryIcon,
          categoryName: info.category,
        ),
        verticalSpace(4),
        RatintgRowWidget(rating: info.rating),
        verticalSpace(4),
        DetailRow(
          detailIcon: Icons.people,
          strDetail: '${info.readersCount} ${LocaleKeys.Readers}',
        ),
      ],
    );
  }
}
