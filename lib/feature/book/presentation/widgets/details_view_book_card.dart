import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:library_app/core/helper/spacing.dart';
import 'package:library_app/feature/book/presentation/widgets/book_cover_widget.dart';
import 'package:library_app/feature/book/presentation/widgets/book_info_widget.dart';
import '../../domain/entities/book_info.dart';
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
