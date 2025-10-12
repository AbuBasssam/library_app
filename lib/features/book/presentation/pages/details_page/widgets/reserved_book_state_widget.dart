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

class ReservedBookStateWidget extends StatelessWidget {
  final Duration remainingTime;
  final VoidCallback onCancelReservation;
  final VoidCallback onWishlistPressed;

  const ReservedBookStateWidget({
    super.key,
    required this.remainingTime,
    required this.onCancelReservation,
    required this.onWishlistPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Reserved Info Card
        BookStateCard(
          backgroundColor: AppColors.yellow50,
          borderColor: AppColors.yellow300,
          icon: Icons.access_time,
          iconColor: AppColors.amber800,
          title: LocaleKeys.ready_for_pickup.tr(),
          titleColor: AppColors.yellow800,
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '⏰ ${LocaleKeys.pickup_deadline.tr()}',
                style: AppStyles.font14RichBlackRegular.copyWith(
                  color: AppColors.yellow700,
                ),
              ),
              verticalSpace(8),
              Text(
                LocaleKeys.time_remaining.tr(
                  namedArgs: {
                    'hours': remainingTime.inHours.toString(),
                    'minutes': remainingTime.inMinutes.remainder(60).toString(),
                  },
                ),
                //_formatDuration(remainingTime),
                style: AppStyles.font18Yellow900Bold,
              ),
            ],
          ),
        ),
        verticalSpace(12),

        // Action Buttons
        ActionButtonsRow(
          primaryButton: PrimaryActionButton(
            onPressed: onCancelReservation,
            icon: Icons.cancel_outlined,
            label: LocaleKeys.cancel_reservation.tr(),
            backgroundColor: AppColors.amber800,
          ),
          secondaryButton: WishlistButton(onPressed: onWishlistPressed),
          spacing: 8,
        ),
      ],
    );
  }
}
