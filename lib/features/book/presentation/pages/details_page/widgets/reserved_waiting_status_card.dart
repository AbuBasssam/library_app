import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:library_app/core/helpers/extension.dart';
import 'package:library_app/core/helpers/spacing.dart';
import 'package:library_app/core/theme/app_colors.dart';
import 'package:library_app/core/theme/app_styles.dart';
import 'package:library_app/features/book/domain/entities/reserved_book_status.dart';
import 'package:library_app/features/book/presentation/pages/details_page/widgets/action_buttons_row.dart';
import 'package:library_app/features/book/presentation/pages/details_page/widgets/book_state_card.dart';
import 'package:library_app/features/book/presentation/pages/details_page/widgets/notification_box.dart';
import 'package:library_app/features/book/presentation/pages/details_page/widgets/primary_action_button.dart';
import 'package:library_app/features/book/presentation/pages/details_page/widgets/wishlist_button.dart';
import 'package:library_app/generated/locale_keys.g.dart';
import 'package:lucide_icons/lucide_icons.dart';

class ReservedWaitingStatusCard extends StatelessWidget {
  final ReservedBookStatus stateData;
  final VoidCallback onCancelReservation;
  final VoidCallback onWishlistPressed;

  const ReservedWaitingStatusCard(
      {super.key,
      required this.stateData,
      required this.onCancelReservation,
      required this.onWishlistPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BookStateCard(
          backgroundColor: AppColors.orange50,
          borderColor: AppColors.orange200,
          icon: LucideIcons.users,
          iconColor: AppColors.orange700,
          title: LocaleKeys.waiting_list_status.tr(
            namedArgs: {'count': '${stateData.waitingListCount}'},
          ),
          titleColor: AppColors.orange800,
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '⏱️ ${LocaleKeys.reserve_estimated_wait.tr()} :  ${LocaleKeys.reserve_days_count.tr(
                  namedArgs: {'count': '${stateData.estimatedDays}'},
                )}',
                style: AppStyles.font14RichBlackRegular.copyWith(
                  color: AppColors.orange600,
                ),
              ),
              verticalSpace(4),
              Text(
                '📅 ${LocaleKeys.reserve_estimated_date.tr()} : ${DateTime.now().add(Duration(days: stateData.estimatedDays)).toLocalizedDate(context)}',
                style: AppStyles.font14RichBlackRegular.copyWith(
                  color: AppColors.orange600,
                ),
              ),
              verticalSpace(12),
              NotificationBox(),
            ],
          ),
        ),
        verticalSpace(8),
        ActionButtonsRow(
          primaryButton: PrimaryActionButton(
            onPressed: onCancelReservation,
            icon: Icons.cancel_outlined,
            label: LocaleKeys.cancel_reservation.tr(),
            backgroundColor: AppColors.orange700,
          ),
          secondaryButton: WishlistButton(onPressed: onWishlistPressed),
        ),
      ],
    );
  }
}
