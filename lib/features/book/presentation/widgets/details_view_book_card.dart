import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../domain/entities/book_info.dart';
import '../view models/detail_view_info.dart';
import '/core/helper/spacing.dart';
import '/features/book/domain/entities/book_cover_style.dart';
import '/features/book/presentation/widgets/book_cover_widget.dart';
import '/features/book/presentation/widgets/book_info_widget.dart';

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
            coverStyle: BookCoverStyle(
              imageWidth: 120,
              imageHeight: 160,
            ),
          ),
          horizontalSpace(20),
          // Book Info
          Expanded(
            child: BookInfoWidget(
              info: BookInfo(
                title: info.homeViewInfo.title,
                author: info.homeViewInfo.author,
                publishYear: info.publishDate.year,
                pagesCount: info.pagesCount,
                publisher: info.publisher,
                isbn: info.isbn,
                language: info.language,
                category: info.category,
                rating: info.rating,
                readersCount: info.readersCount,
              ),
              categoryIcon: Icons.science,
            ),
          ),
        ],
      ),
    );
  }
}
