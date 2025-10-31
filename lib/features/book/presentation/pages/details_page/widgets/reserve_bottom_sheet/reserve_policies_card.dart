import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:library_app/core/helpers/spacing.dart';
import 'package:library_app/core/theme/app_colors.dart';
import 'package:library_app/core/theme/app_styles.dart';
import 'package:library_app/core/widgets/animated_details_card.dart';
import 'package:library_app/core/widgets/card_title_row.dart';
import 'package:library_app/core/widgets/notice_row.dart';
import 'package:library_app/features/book/domain/entities/reservable_book_status.dart';
import 'package:library_app/generated/locale_keys.g.dart';

/// Displays reservation policies and important info
class ReservePoliciesCard extends StatelessWidget {
  final ReservableBookStatus config;
  const ReservePoliciesCard({
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
            icon: Icons.info_outline,
            value: LocaleKeys.important_info.tr(),
            iconColor: AppColors.orange600,
            valueStyle: AppStyles.font15Bold.copyWith(
              color: AppColors.orange800,
            ),
          ),
          verticalSpace(12),
          NoticeRow(
            value: LocaleKeys.reserve_policy_pickup_window.tr(
              namedArgs: {'hours': config.pickupWindowHours.toString()},
            ),
            valueColor: AppColors.orange800,
            highlightText: config.pickupWindowHours.toString(),
          ),
          NoticeRow(
            value: LocaleKeys.reserve_policy_max_reservations.tr(
              namedArgs: {'count': config.maxActiveReservations.toString()},
            ),
            valueColor: AppColors.orange800,
            highlightText: '${config.maxActiveReservations}',
          ),
          NoticeRow(
            value: LocaleKeys.reserve_policy_cancellation.tr(),
            valueColor: AppColors.orange800,
          ),
          NoticeRow(
            value: LocaleKeys.availability_notification.tr(),
            valueColor: AppColors.orange800,
            isBold: true,
          ),
        ],
      ),
    );
  }
}
