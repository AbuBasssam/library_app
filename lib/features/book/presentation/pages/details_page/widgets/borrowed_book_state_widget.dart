import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:library_app/core/helpers/spacing.dart';
import 'package:library_app/core/theme/app_colors.dart';
import 'package:library_app/core/theme/app_styles.dart';
import 'package:library_app/features/book/presentation/pages/details_page/widgets/action_buttons_row.dart';
import 'package:library_app/features/book/presentation/pages/details_page/widgets/book_state_card.dart';
import 'package:library_app/features/book/presentation/pages/details_page/widgets/primary_action_button.dart';
import 'package:library_app/features/book/presentation/pages/details_page/widgets/wishlist_button.dart';
import 'package:library_app/generated/locale_keys.g.dart';

class BorrowedBookStateWidget extends StatelessWidget {
  final DateTime returnDate;
  final VoidCallback onExtendPressed;
  final VoidCallback onWishlistPressed;

  const BorrowedBookStateWidget({
    super.key,
    required this.returnDate,
    required this.onExtendPressed,
    required this.onWishlistPressed,
  });

  String _formatDate(DateTime date) => '${date.day}/${date.month}/${date.year}';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BookStateCard(
          backgroundColor: AppColors.green50,
          borderColor: AppColors.green200,
          icon: Icons.book,
          iconColor: AppColors.green600,
          title: LocaleKeys.currently_borrowed.tr(),
          titleColor: AppColors.green800,
          content: Text(
            '📅 ${LocaleKeys.return_date.tr(
              namedArgs: {'date': _formatDate(returnDate)},
            )}',
            style: AppStyles.font14RichBlackRegular.copyWith(
              color: AppColors.green700,
            ),
          ),
        ),
        verticalSpace(8),
        ActionButtonsRow(
          primaryButton: PrimaryActionButton(
            onPressed: onExtendPressed,
            icon: Icons.access_time,
            label: LocaleKeys.extend_loan.tr(),
            backgroundColor: AppColors.green600,
          ),
          secondaryButton: WishlistButton(onPressed: onWishlistPressed),
          spacing: 8,
        ),
      ],
    );
  }
}
