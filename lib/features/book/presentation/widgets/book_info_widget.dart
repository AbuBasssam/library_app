import 'package:flutter/material.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theme/app_styles.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../domain/entities/book_info.dart';
import 'category_row_widget.dart';
import 'detail_row.dart';
import 'ratintg_row_widget.dart';

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
