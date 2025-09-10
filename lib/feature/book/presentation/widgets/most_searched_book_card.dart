import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:library_app/core/helper/spacing.dart';
import 'package:library_app/core/theme/font_weight_helper.dart';
import 'package:library_app/feature/book/domain/entities/book_cover_style.dart';
import 'package:library_app/feature/book/presentation/view%20models/most_search_view_info.dart';
import 'package:library_app/feature/book/presentation/widgets/book_cover_widget.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_styles.dart';

class MostSearchedBookCard extends StatelessWidget {
  final MostSearchViewInfo info;

  const MostSearchedBookCard({super.key, required this.info});

  @override
  Widget build(BuildContext context) {
    final imageWidth = 160;
    return Column(
      children: [
        // Book Cover
        BookCoverWidget(
          coverInfo: info.coverInfo,
          coverStyle: BookCoverStyle(
            imageWidth: 120,
            imageHeight: imageWidth,
            bannerHorizontalPadding: 4,
            bannerVerticalPadding: 2,
          ),
        ),
        verticalSpace(4),
        // Book Info
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: imageWidth.w),
          child: Text(
            info.title,
            style: AppStyles.font12CoolGrayMedium.copyWith(
              color: AppColors.richBlack,
              fontWeight: FontWeightHelper.semiBold,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
