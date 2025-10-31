import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:library_app/core/helpers/spacing.dart';
import 'package:library_app/core/theme/app_colors.dart';
import 'package:library_app/core/theme/app_styles.dart';
import 'package:library_app/core/widgets/animated_details_card.dart';
import 'package:library_app/core/widgets/card_title_row.dart';
import 'package:library_app/core/widgets/notice_row.dart';
import 'package:library_app/features/book/domain/entities/borrowed_book_status.dart';
import 'package:library_app/generated/locale_keys.g.dart';

class ExtendWarningsCard extends StatelessWidget {
  final BorrowedBookStatus config;

  const ExtendWarningsCard({
    super.key,
    required this.config,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedDetailsCard(
      borderColor: AppColors.orange200,
      cardColor: AppColors.orange50,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CardTitleRow(
            icon: Icons.info,
            value: LocaleKeys.important_info.tr(),
            iconColor: AppColors.orange800,
            valueStyle: AppStyles.font15Bold.copyWith(
              color: AppColors.orange800,
            ),
          ),
          verticalSpace(12),
          NoticeRow(
            valueColor: AppColors.orange800,
            value: _txtMaxExtensionCounts(),
            highlightText: config.maxExtensionCount.toString(),
          ),
          NoticeRow(
            valueColor: AppColors.orange800,
            value: _txtMaxExtensionDaysCount(),
            highlightText: config.maxAllowedExtendDays.toString(),
          ),
          NoticeRow(
            valueColor: AppColors.orange800,
            value: _txtMaxBorrowingDaysCount(),
            highlightText: config.maxBorrowingDays.toString(),
            isBold: true,
          ),
        ],
      ),
    );
  }

  String _txtMaxBorrowingDaysCount() {
    return LocaleKeys.extend_max_total_days.tr(
      namedArgs: {
        'days': config.maxBorrowingDays.toString(),
      },
    );
  }

  String _txtMaxExtensionDaysCount() {
    return LocaleKeys.extend_max_days_per_extension.tr(
      namedArgs: {
        'days': config.maxExtensionDays.toString(),
      },
    );
  }

  String _txtMaxExtensionCounts() {
    return LocaleKeys.extend_max_extensions.tr(
      namedArgs: {
        'count': config.maxExtensionCount.toString(),
      },
    );
  }
}
