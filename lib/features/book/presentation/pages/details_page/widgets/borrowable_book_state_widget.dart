import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:library_app/core/theme/app_colors.dart';
import 'package:library_app/features/book/presentation/pages/details_page/widgets/action_buttons_row.dart';
import 'package:library_app/features/book/presentation/pages/details_page/widgets/primary_action_button.dart';
import 'package:library_app/features/book/presentation/pages/details_page/widgets/wishlist_button.dart';
import 'package:library_app/generated/locale_keys.g.dart';

class BorrowableBookStateWidget extends StatelessWidget {
  final VoidCallback onBorrowPressed;
  final VoidCallback onWishlistPressed;

  const BorrowableBookStateWidget({
    super.key,
    required this.onBorrowPressed,
    required this.onWishlistPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ActionButtonsRow(
      primaryButton: PrimaryActionButton(
        onPressed: onBorrowPressed,
        icon: Icons.book,
        label: LocaleKeys.borrow_book.tr(),
        backgroundColor: AppColors.blue600,
      ),
      secondaryButton: WishlistButton(onPressed: onWishlistPressed),
    );
  }
}
