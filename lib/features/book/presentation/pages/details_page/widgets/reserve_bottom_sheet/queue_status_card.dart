import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:library_app/core/helpers/extension.dart';
import 'package:library_app/core/helpers/spacing.dart';
import 'package:library_app/core/theme/app_colors.dart';
import 'package:library_app/core/widgets/animated_gradient_card.dart';
import 'package:library_app/core/widgets/card_title_row.dart';
import 'package:library_app/features/book/domain/entities/reservable_book_status.dart';
import 'package:library_app/features/book/presentation/pages/details_page/widgets/borrow_bottom_sheet/borrowing_details_card/detail_card_row.dart';
import 'package:library_app/generated/locale_keys.g.dart';

/// Displays queue position and estimated availability
class QueueStatusCard extends StatelessWidget {
  final ReservableBookStatus config;

  const QueueStatusCard({
    super.key,
    required this.config,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedGradientCard(
      gradientColors: [AppColors.blue50, Colors.white],
      borderColor: AppColors.blue200,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CardTitleRow(
            icon: Icons.people_outline,
            value: LocaleKeys.reserve_queue_status.tr(),
            iconColor: AppColors.blue600,
          ),
          verticalSpace(12),
          DetailCardRow(
            label: LocaleKeys.reserve_people_ahead.tr(),
            value: LocaleKeys.reserve_people_count.tr(
              namedArgs: {'count': config.waitingListCount.toString()},
            ),
          ),
          DetailCardRow(
            label: LocaleKeys.reserve_queue_position.tr(),
            value: LocaleKeys.reserve_position_number.tr(
              namedArgs: {'position': (config.waitingListCount + 1).toString()},
            ),
            valueColor: AppColors.blue600,
          ),
          DetailCardRow(
            label: LocaleKeys.reserve_estimated_wait.tr(),
            value: LocaleKeys.reserve_days_count.tr(
              namedArgs: {'count': config.estimatedDays.toString()},
            ),
          ),
          DetailCardRow(
            label: LocaleKeys.reserve_estimated_date.tr(),
            value: config.estimatedAvailableDate.toLocalizedDate(context),
          ),
        ],
      ),
    );
  }
}
