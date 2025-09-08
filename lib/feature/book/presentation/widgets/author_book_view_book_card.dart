import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:library_app/core/helper/spacing.dart';
import 'package:library_app/feature/book/presentation/view%20models/author_book_view_info.dart';
import 'package:library_app/feature/book/presentation/widgets/book_cover_widget.dart';
import '../../../../core/theme/app_styles.dart';
import 'ratintg_row_widget.dart';

class AuthorBookViewBookCard extends StatelessWidget {
  final AuthorBookViewInfo info;

  const AuthorBookViewBookCard({
    super.key,
    required this.info,
  });

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
            imageWidth: imageWidth,
            imageHeight: 180,
          ),
          verticalSpace(8),
          Text(
            info.title,
            style: AppStyles.font14RichBlackBold,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          verticalSpace(2),
          Text(
            '${info.publishYear}',
            style: AppStyles.font14BlueMedium,
          ),
          verticalSpace(2),
          RatintgRowWidget(rating: info.rating),
        ],
      ),
    );
  }
}
