import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:library_app/core/helpers/extension.dart';
import 'package:library_app/core/helpers/spacing.dart';
import 'package:library_app/core/theme/app_colors.dart';
import 'package:library_app/core/widgets/animated_gradient_card.dart';
import 'package:library_app/core/widgets/card_title_row.dart';
import 'package:library_app/features/book/presentation/pages/details_page/widgets/borrow_bottom_sheet/borrowing_details_card/detail_card_row.dart';
import 'package:library_app/generated/locale_keys.g.dart';

/// Displays borrowing details summary
class BorrowingDetailsCard extends StatelessWidget {
  final int? days;
  const BorrowingDetailsCard({super.key, required this.days});

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
            value: LocaleKeys.borrow_details_title.tr(),
            iconColor: AppColors.blue600,
          ),
          verticalSpace(12),
          DetailCardRow(
            label: LocaleKeys.borrow_details_start_date.tr(),
            value: DateTime.now().toLocalizedDate(context),
          ),
          DetailCardRow(
            label: LocaleKeys.borrow_details_return_date.tr(),
            value: _txtReturnDate(context),
          ),
          DetailCardRow(
            label: LocaleKeys.borrow_details_duration.tr(),
            value: _txtBorrowDaysCount(),
            valueColor: days != null ? AppColors.blue600 : null,
          ),
        ],
      ),
    );
  }

  String _txtReturnDate(BuildContext context) =>
      days != null ? _getReturnDate(days!, context) : '–';

  String _txtBorrowDaysCount() {
    return days != null
        ? LocaleKeys.borrow_days_count.tr(
            namedArgs: {'count': days.toString()},
          )
        : '–';
  }

  String _getReturnDate(int days, BuildContext context) {
    final returnDate = DateTime.now().add(Duration(days: days));
    return returnDate.toLocalizedDate(context);
  }
}
