import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:library_app/core/helpers/spacing.dart';
import 'package:library_app/core/theme/app_colors.dart';
import 'package:library_app/core/theme/app_styles.dart';
import 'package:library_app/features/book/domain/entities/reservable_book_status.dart';
import 'package:library_app/features/book/presentation/pages/details_page/widgets/action_buttons_row.dart';
import 'package:library_app/features/book/presentation/pages/details_page/widgets/book_state_card.dart';
import 'package:library_app/features/book/presentation/pages/details_page/widgets/primary_action_button.dart';
import 'package:library_app/features/book/presentation/pages/details_page/widgets/wishlist_button.dart';
import 'package:library_app/generated/locale_keys.g.dart';
import 'package:lucide_icons/lucide_icons.dart';

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
                '⏱️ ${LocaleKeys.estimated_availability.tr(
                  namedArgs: {'day': '${stateData.estimatedDays}'},
                )}',
                style: AppStyles.font14RichBlackRegular.copyWith(
                  color: AppColors.orange600,
                ),
              ),
              verticalSpace(12),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                decoration: BoxDecoration(
                  color: AppColors.orange100,
                  borderRadius: BorderRadius.circular(4.r),
                ),
                child: Text(
                  '💡 ${LocaleKeys.availability_notification.tr()}',
                  style: AppStyles.font12Gray600Regular.copyWith(
                    color: AppColors.orange800,
                  ),
                ),
              ),
            ],
          ),
        ),
        verticalSpace(8),
        ActionButtonsRow(
          primaryButton: PrimaryActionButton(
            onPressed: onReservePressed,
            icon: Icons.access_time,
            label: LocaleKeys.reserve_book.tr(),
            backgroundColor: AppColors.orange700,
          ),
          secondaryButton: WishlistButton(
            onPressed: onWishlistPressed,
          ),
        ),
      ],
    );
  }
}
