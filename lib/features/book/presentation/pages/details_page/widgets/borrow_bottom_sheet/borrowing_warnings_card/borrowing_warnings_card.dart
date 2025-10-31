import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:library_app/core/helpers/spacing.dart';
import 'package:library_app/core/theme/app_colors.dart';
import 'package:library_app/core/theme/app_styles.dart';
import 'package:library_app/core/widgets/animated_details_card.dart';
import 'package:library_app/core/widgets/card_title_row.dart';
import 'package:library_app/core/widgets/notice_row.dart';
import 'package:library_app/generated/locale_keys.g.dart';

/// Displays important borrowing warnings
class BorrowingWarningsCard extends StatelessWidget {
  final int pickupRequiredHours;
  final double finePerDay;

  const BorrowingWarningsCard({
    super.key,
    required this.pickupRequiredHours,
    required this.finePerDay,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedDetailsCard(
      borderColor: AppColors.red200,
      cardColor: AppColors.red100,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CardTitleRow(
            icon: Icons.warning_amber,
            value: LocaleKeys.important_info.tr(),
            iconColor: AppColors.red800,
            valueStyle: AppStyles.font15Bold.copyWith(color: AppColors.red800),
          ),
          verticalSpace(12),
          NoticeRow(
            value: _txtPickupRequiredHours(),
            valueColor: AppColors.red800,
            //isBold: true,
            highlightText: pickupRequiredHours.toString(),
          ),
          NoticeRow(
            value: _txtLateDailyFee(),
            valueColor: AppColors.red800,
            highlightText: finePerDay.toStringAsFixed(0),
            //  isBold: true,
          ),
          NoticeRow(
            value: LocaleKeys.borrow_warnings_auto_charge.tr(),
            valueColor: AppColors.red800,
          ),
        ],
      ),
    );
  }

  String _txtLateDailyFee() {
    return LocaleKeys.borrow_warnings_fine.tr(
      namedArgs: {'amount': finePerDay.toStringAsFixed(0)},
    );
  }

  String _txtPickupRequiredHours() {
    return LocaleKeys.borrow_warnings_pickup.tr(
      namedArgs: {'hours': pickupRequiredHours.toString()},
    );
  }
}
