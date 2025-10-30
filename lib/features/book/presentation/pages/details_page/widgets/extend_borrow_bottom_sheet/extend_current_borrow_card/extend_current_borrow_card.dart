import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:library_app/core/helpers/extension.dart';
import 'package:library_app/core/helpers/spacing.dart';
import 'package:library_app/core/theme/app_colors.dart';
import 'package:library_app/core/theme/app_styles.dart';
import 'package:library_app/core/widgets/animated_gradient_card.dart';
import 'package:library_app/core/widgets/card_title_row.dart';
import 'package:library_app/features/book/domain/entities/borrowed_book_status.dart';
import 'package:library_app/features/book/presentation/pages/details_page/widgets/borrow_bottom_sheet/borrowing_details_card/detail_card_row.dart';
import 'package:library_app/features/book/presentation/pages/details_page/widgets/extend_borrow_bottom_sheet/extend_current_borrow_card/days_remaining_indicator.dart';
import 'package:library_app/generated/locale_keys.g.dart';

/// Displays current borrow information with days remaining indicator
class ExtendCurrentBorrowCard extends StatelessWidget {
  final BorrowedBookStatus config;

  const ExtendCurrentBorrowCard({super.key, required this.config});

  @override
  Widget build(BuildContext context) {
    return AnimatedGradientCard(
      gradientColors: [AppColors.blue50, Colors.white],
      borderColor: AppColors.blue200,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CardTitleRow(
            icon: Icons.info_outline,
            value: LocaleKeys.extend_current_borrow_info.tr(),
            iconColor: AppColors.blue600,
            valueStyle: AppStyles.font15Bold.copyWith(color: AppColors.blue800),
          ),
          verticalSpace(12),
          DetailCardRow(
            label: LocaleKeys.extend_borrow_date.tr(),
            value: config.borrowDate.toLocalizedDate(context),
          ),
          DetailCardRow(
            label: LocaleKeys.extend_current_due_date.tr(),
            value: config.dueDate.toLocalizedDate(context),
          ),
          if (config.shouldShowDaysRemaining) ...[
            verticalSpace(8),
            DaysRemainingIndicator(
              isUrgent: config.isUrgent,
              daysRemaining: config.daysRemaining,
            )
          ],
        ],
      ),
    );
  }
}
