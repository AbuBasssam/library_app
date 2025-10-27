import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:library_app/core/helpers/spacing.dart';
import 'package:library_app/core/theme/app_colors.dart';
import 'package:library_app/core/theme/app_styles.dart';
import 'package:library_app/features/book/domain/entities/overdue_book_status.dart';
import 'package:library_app/features/book/presentation/pages/details_page/widgets/book_state_card.dart';
import 'package:library_app/features/book/presentation/pages/details_page/widgets/wishlist_button.dart';
import 'package:library_app/generated/locale_keys.g.dart';

class OverdueBookStateWidget extends StatelessWidget {
  // final DateTime dueDate;
  // final double lateFee;
  final OverdueBookStatus stateData;
  final VoidCallback onWishlistPressed;

  const OverdueBookStateWidget({
    super.key,
    required this.stateData,
    required this.onWishlistPressed,
  });

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Overdue Warning Card
        BookStateCard(
          backgroundColor: AppColors.red50,
          borderColor: AppColors.red300,
          icon: Icons.warning_amber_rounded,
          iconColor: AppColors.red600,
          title: LocaleKeys.book_overdue.tr(),
          titleColor: AppColors.deepCherry,
          gradient: const LinearGradient(
            colors: [AppColors.red50, AppColors.orange200],
          ),
          padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 16.0.h),
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
              color: AppColors.red600With10Opacity,
              blurRadius: 8.r,
              offset: Offset(0, 2.h),
            ),
          ],
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                LocaleKeys.return_urgent.tr(),
                style: AppStyles.font14RichBlackRegular.copyWith(
                  color: AppColors.red700,
                ),
              ),
              verticalSpace(16),

              // Overdue Details
              Row(
                children: [
                  Expanded(
                    child: _buildDetailCard(
                      label: LocaleKeys.due_date.tr(),
                      value: _formatDate(stateData.dueDate),
                      backgroundColor: Colors.white,
                    ),
                  ),
                  horizontalSpace(12),
                  Expanded(
                    child: _buildDetailCard(
                      label: LocaleKeys.current_fine.tr(),
                      value: _txtFee(context, stateData.lateFee),
                      vlueStyle: AppStyles.font14Red600Bold.copyWith(
                        fontSize: 16.sp,
                        fontFamily: 'Tajawal',
                      ),
                      backgroundColor: AppColors.red100,
                      valueSize: 20,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        verticalSpace(12),

        // Wishlist Button
        SizedBox(
          width: double.infinity,
          child: WishlistButton(
            onPressed: onWishlistPressed,
            isExpanded: false,
          ),
        ),
      ],
    );
  }

  String _txtFee(BuildContext context, double lateFee) {
    final localeCode = context.locale.languageCode;

    final format = NumberFormat.currency(
      locale: localeCode == 'en' ? 'en_SA' : 'ar_SA',
      symbol: localeCode == 'en' ? 'SAR' : '﷼',
      decimalDigits: 2,
    );

    return format.format(lateFee);
  }

  Widget _buildDetailCard({
    required String label,
    required String value,
    TextStyle? vlueStyle,
    required Color backgroundColor,
    double valueSize = 16,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(color: AppColors.red300),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: AppStyles.font12Gray600Regular),
          verticalSpace(4),
          Text(
            value,
            style: vlueStyle ??
                TextStyle(
                  fontSize: valueSize.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.red600,
                ),
          ),
        ],
      ),
    );
  }
}
