import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:library_app/core/helper/spacing.dart';
import 'package:library_app/core/theme/app_styles.dart';
import 'package:library_app/feature/book/presentation/widgets/book_cover_widget.dart';
import 'package:library_app/feature/book/presentation/widgets/category_row_widget.dart';
import 'package:library_app/feature/book/presentation/widgets/detail_row.dart';
import 'package:library_app/feature/book/presentation/widgets/ratintg_row_widget.dart';
import 'package:library_app/generated/locale_keys.g.dart';
import '../view models/detail_view_info.dart';

class DetailsViewBookCard extends StatelessWidget {
  final DetailViewInfo info;

  const DetailsViewBookCard({
    super.key,
    required this.info,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Book Cover
          BookCoverWidget(
            coverInfo: info.homeViewInfo.coverInfo,
            imageWidth: 120,
            imageHeight: 160,
          ),
          horizontalSpace(20),

          // Book Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  info.homeViewInfo.title,
                  style: AppStyles.font24Black87Bold,
                ),
                verticalSpace(8),
                DetailRow(
                  detailIcon: Icons.person,
                  strDetail: info.homeViewInfo.author,
                ),
                verticalSpace(4),
                DetailRow(
                  detailIcon: Icons.calendar_today,
                  strDetail: '${info.publishDate.year}',
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
                  icon: Icons.science,
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
            ),
          ),
        ],
      ),
    );
  }
}
