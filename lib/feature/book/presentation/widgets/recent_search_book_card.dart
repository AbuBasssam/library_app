import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:library_app/feature/book/domain/entities/book_cover_style.dart';
import 'package:library_app/feature/book/domain/entities/recent_search_info.dart';
import 'package:library_app/feature/book/presentation/widgets/recent_search_action_icons_row.dart';
import 'package:library_app/feature/book/presentation/widgets/recent_search_summary_column.dart';
import '../../../../core/helper/spacing.dart';
import '../../../../core/theme/app_colors.dart';
import '../view models/home_view_info.dart';
import 'book_cover_widget.dart';

class RecentSearchBookCard extends StatelessWidget {
  final HomeViewInfo info;
  final DateTime searchDate;

  const RecentSearchBookCard({
    super.key,
    required this.info,
    required this.searchDate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      margin: EdgeInsets.only(bottom: 8.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.lightGray, width: 1.w),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(13),
            blurRadius: 4.r,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Book Cover
          BookCoverWidget(
            coverInfo: info.coverInfo,
            coverStyle: BookCoverStyle(
              imageWidth: 60,
              imageHeight: 80,
              bannerHorizontalPadding: 2,
              bannerVerticalPadding: 0,
            ),
          ),
          horizontalSpace(12),
          // Book Info
          Expanded(
            child: RecentSearchSummaryColumn(
              info: RecentSearchInfo(
                title: info.title,
                author: info.author,
                searchDate: searchDate,
              ),
            ),
          ),
          horizontalSpace(8),
          RecentSearchActionIconsRow(),
        ],
      ),
    );
  }
}
