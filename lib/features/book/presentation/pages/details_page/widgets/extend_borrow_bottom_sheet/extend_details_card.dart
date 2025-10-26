import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:library_app/core/helpers/extension.dart';
import 'package:library_app/core/helpers/spacing.dart';
import 'package:library_app/core/theme/app_colors.dart';
import 'package:library_app/core/widgets/animated_gradient_card.dart';
import 'package:library_app/core/widgets/card_title_row.dart';
import 'package:library_app/features/book/presentation/models/extending_config.dart';
import 'package:library_app/features/book/presentation/pages/details_page/widgets/borrow_bottom_sheet/borrowing_details_card/detail_row.dart';
import 'package:library_app/generated/locale_keys.g.dart';

class ExtendDetailsCard extends StatelessWidget {
  final ExtendingConfig config;
  final int? extendDays;

  const ExtendDetailsCard({
    super.key,
    required this.config,
    required this.extendDays,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedGradientCard(
      gradientColors: [AppColors.softWhiteGray, AppColors.blue50],
      borderColor: AppColors.lightGray,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CardTitleRow(
            icon: Icons.calendar_today,
            value: LocaleKeys.extend_details_title.tr(),
            iconColor: AppColors.blue600,
          ),
          verticalSpace(12),
          DetailRow(
            label: LocaleKeys.extend_current_due_date.tr(),
            value: config.dueDate.toLocalizedDate(context),
          ),
          DetailRow(
            label: LocaleKeys.extend_extension_by.tr(),
            value: _txtExtendDaysCount(),
            valueColor: extendDays != null ? AppColors.blue600 : Colors.grey,
          ),
          if (extendDays != null) ...[
            DetailRow(
              label: LocaleKeys.extend_new_due_date.tr(),
              value: _newDueDate(context),
              valueColor: AppColors.green600,
            ),
            verticalSpace(8),

            // Divider
            Divider(color: AppColors.lightGray),

            //Spacing
            verticalSpace(8),
            DetailRow(
              label: LocaleKeys.extend_total_days.tr(),
              value: _txtExtendTotalDays(),
              valueColor: AppColors.blue800,
            ),
          ],
        ],
      ),
    );
  }

  String _txtExtendTotalDays() {
    return LocaleKeys.extend_total_days_value.tr(
      namedArgs: {
        'current': config.totalDaysAfterExtend(extendDays!).toString(),
        'max': config.maxBorrowingDays.toString(),
      },
    );
  }

  String _txtExtendDaysCount() {
    return extendDays != null
        ? LocaleKeys.extend_days_count.tr(
            namedArgs: {'count': extendDays.toString()},
          )
        : '–';
  }

  String _newDueDate(BuildContext context) {
    return config.calculateNewDueDate(extendDays!).toLocalizedDate(context);
  }
}
