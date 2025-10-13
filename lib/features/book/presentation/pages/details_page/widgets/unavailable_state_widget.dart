import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:library_app/core/helpers/spacing.dart';
import 'package:library_app/core/theme/app_colors.dart';
import 'package:library_app/core/theme/app_styles.dart';
import 'package:library_app/core/theme/font_weight_helper.dart';
import 'package:library_app/features/book/presentation/pages/details_page/widgets/book_state_card.dart';
import 'package:library_app/features/book/presentation/pages/details_page/widgets/primary_action_button.dart';
import 'package:library_app/features/book/presentation/pages/details_page/widgets/wishlist_button.dart';
import 'package:library_app/generated/locale_keys.g.dart';

class UnavailableStateWidget extends StatelessWidget {
  final VoidCallback onNotifyPressed;
  final VoidCallback onWishlistPressed;

  const UnavailableStateWidget({
    super.key,
    required this.onNotifyPressed,
    required this.onWishlistPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BookStateCard(
          backgroundColor: Colors.grey[50]!,
          borderColor: Colors.grey[300]!,
          icon: Icons.warning_amber_rounded,
          iconColor: Colors.grey[600]!,
          title: LocaleKeys.currently_unavailable.tr(),
          titleColor: Colors.grey[800]!,
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  style: AppStyles.font14RichBlackRegular.copyWith(
                    color: AppColors.gray700,
                    height: 1.5.h,
                  ),
                  children: [
                    TextSpan(text: LocaleKeys.unavailable_description.tr()),
                    TextSpan(
                      text: '\n${LocaleKeys.notify_availability.tr()}',
                      style: TextStyle(
                        color: AppColors.blue600,
                        fontWeight: FontWeightHelper.semiBold,
                      ),
                    ),
                  ],
                ),
              ),
              verticalSpace(16),
              SizedBox(
                width: double.infinity,
                child: PrimaryActionButton(
                  onPressed: onNotifyPressed,
                  icon: IconsaxPlusLinear.notification,
                  label: LocaleKeys.notify_me_button.tr(),
                  backgroundColor: Colors.grey[800]!,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                ),
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
          ),
        ),
      ],
    );
  }
}
