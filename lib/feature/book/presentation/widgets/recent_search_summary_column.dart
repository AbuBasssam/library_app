import 'package:flutter/material.dart';
import 'package:library_app/core/helper/spacing.dart';
import 'package:library_app/core/helper/time_ago_helper.dart';
import 'package:library_app/core/theme/app_styles.dart';
import 'package:library_app/feature/book/domain/entities/recent_search_info.dart';

class RecentSearchSummaryColumn extends StatelessWidget {
  const RecentSearchSummaryColumn({
    super.key,
    required this.info,
  });

  final RecentSearchInfo info;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          info.title,
          style: AppStyles.font14RichBlackBold,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        verticalSpace(4),
        Text(
          info.author,
          style: AppStyles.font12CoolGrayMedium,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        verticalSpace(4),
        Text(
          TimeAgoHelper.timeAgo(info.searchDate),
          style: AppStyles.font12CoolGrayMedium,
        ),
      ],
    );
  }
}
