import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:library_app/core/helpers/spacing.dart';
import 'package:library_app/core/theme/app_colors.dart';
import 'package:library_app/core/theme/app_styles.dart';
import 'package:library_app/features/book/presentation/pages/details_page/widgets/borrow_bottom_sheet/borrowing_details_card/detail_row.dart';
import 'package:library_app/generated/locale_keys.g.dart';

/// Displays borrowing details summary
class BorrowingDetailsCard extends StatelessWidget {
  final int? days;
  const BorrowingDetailsCard({super.key, required this.days});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 500),
      tween: Tween(begin: 0.0, end: 1.0),
      curve: Curves.easeOutCubic,
      builder: (context, value, child) {
        return Transform.scale(
          scale: 0.9 + (0.1 * value),
          child: Opacity(
            opacity: value,
            child: child,
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [AppColors.softWhiteGray, AppColors.blue50],
          ),
          border: Border.all(color: AppColors.lightGray),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [_icoCalendar(), horizontalSpace(8), _txtTitle()]),
            verticalSpace(12),
            DetailRow(
              label: LocaleKeys.borrow_details_start_date.tr(),
              value: LocaleKeys.borrow_today.tr(),
            ),
            DetailRow(
              label: LocaleKeys.borrow_details_return_date.tr(),
              value: days != null ? _getReturnDate(days!, context) : '–',
            ),
            DetailRow(
              label: LocaleKeys.borrow_details_duration.tr(),
              value: days != null
                  ? LocaleKeys.borrow_days_count.tr(
                      namedArgs: {'count': days.toString()},
                    )
                  : '–',
              valueColor: days != null ? AppColors.blue600 : null,
            ),
          ],
        ),
      ),
    );
  }

  Text _txtTitle() {
    return Text(
      LocaleKeys.borrow_details_title.tr(),
      style: AppStyles.font15Bold,
    );
  }

  Icon _icoCalendar() {
    return Icon(
      Icons.calendar_today,
      size: 20.w,
      color: AppColors.blue600,
    );
  }

  String _getReturnDate(int days, BuildContext context) {
    final returnDate = DateTime.now().add(Duration(days: days));
    final locale = context.locale.languageCode;
    return DateFormat('EEEE، d MMMM yyyy', locale == 'ar' ? 'ar_SA' : 'en_US')
        .format(returnDate);
  }
}
