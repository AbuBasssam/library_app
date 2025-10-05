import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../domain/entities/book_cover_style.dart';
import '../view models/similar_books_view_info.dart';
import '/core/theme/app_styles.dart';
import '../../../../core/helpers/spacing.dart';
import 'book_cover_widget.dart';
import 'ratintg_row_widget.dart';

class SimilarViewBookCard extends StatelessWidget {
  final SimilarBooksViewInfo info;

  const SimilarViewBookCard({required this.info, super.key});

  @override
  Widget build(BuildContext context) {
    final int imageWidth = 130;
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: imageWidth.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Book Cover
          BookCoverWidget(
            coverInfo: info.coverInfo,
            coverStyle: BookCoverStyle(
              imageWidth: imageWidth,
              imageHeight: 180,
            ),
          ),
          verticalSpace(8),
          Text(
            info.title,
            style: AppStyles.font14RichBlackBold,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          verticalSpace(2),
          RatintgRowWidget(rating: info.rating),
        ],
      ),
    );
  }
}
