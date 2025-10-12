import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:library_app/core/helpers/spacing.dart';
import 'package:library_app/core/theme/app_colors.dart';
import 'package:library_app/core/theme/app_styles.dart';
import 'package:library_app/features/book/presentation/pages/details_page/widgets/book_state_card.dart';
import 'package:library_app/features/book/presentation/pages/details_page/widgets/primary_action_button.dart';
import 'package:library_app/features/book/presentation/pages/details_page/widgets/wishlist_button.dart';

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
          title: 'Currently unavailable',
          titleColor: Colors.grey[800]!,
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  style: AppStyles.font14RichBlackRegular.copyWith(
                    color: Colors.grey[700],
                    height: 1.5.h,
                  ),
                  children: const [
                    TextSpan(
                      text:
                          'This book is not available for borrowing or reservation at the moment.\n',
                    ),
                    TextSpan(
                      text:
                          'Be the first to know when it becomes available again!',
                      style: TextStyle(
                        color: AppColors.blue600,
                        fontWeight: FontWeight.w600,
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
                  label: 'Notify When Available',
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
