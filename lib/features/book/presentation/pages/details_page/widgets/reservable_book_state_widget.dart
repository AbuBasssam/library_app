import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:library_app/core/theme/app_colors.dart';
import 'package:library_app/features/book/domain/entities/reservable_book_status.dart';
import 'package:library_app/features/book/presentation/pages/details_page/widgets/action_buttons_row.dart';
import 'package:library_app/features/book/presentation/pages/details_page/widgets/primary_action_button.dart';
import 'package:library_app/features/book/presentation/pages/details_page/widgets/wishlist_button.dart';
import 'package:library_app/generated/locale_keys.g.dart';

class ReservableBookStateWidget extends StatelessWidget {
  final ReservableBookStatus stateData;
  final VoidCallback onReservePressed;
  final VoidCallback onWishlistPressed;

  const ReservableBookStateWidget({
    super.key,
    required this.stateData,
    required this.onReservePressed,
    required this.onWishlistPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ActionButtonsRow(
      primaryButton: PrimaryActionButton(
        onPressed: onReservePressed,
        icon: Icons.access_time,
        label: LocaleKeys.reserve_book.tr(),
        backgroundColor: AppColors.orange700,
      ),
      secondaryButton: WishlistButton(onPressed: onWishlistPressed),
    );
  }
}
