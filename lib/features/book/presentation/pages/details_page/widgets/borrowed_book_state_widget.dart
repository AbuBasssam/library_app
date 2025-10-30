import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:library_app/core/theme/app_colors.dart';
import 'package:library_app/features/book/presentation/pages/details_page/widgets/action_buttons_row.dart';
import 'package:library_app/features/book/presentation/pages/details_page/widgets/primary_action_button.dart';
import 'package:library_app/features/book/presentation/pages/details_page/widgets/wishlist_button.dart';
import 'package:library_app/generated/locale_keys.g.dart';

class BorrowedBookStateWidget extends StatelessWidget {
  final VoidCallback onExtendPressed;
  final VoidCallback onWishlistPressed;

  const BorrowedBookStateWidget({
    super.key,
    required this.onExtendPressed,
    required this.onWishlistPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ActionButtonsRow(
      primaryButton: PrimaryActionButton(
        onPressed: onExtendPressed,
        icon: Icons.access_time,
        label: LocaleKeys.extend_loan.tr(),
        backgroundColor: AppColors.green600,
      ),
      secondaryButton: WishlistButton(onPressed: onWishlistPressed),
      spacing: 8,
    );
  }
}
