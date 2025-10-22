import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:library_app/core/helpers/spacing.dart';
import 'package:library_app/core/theme/app_colors.dart';
import 'package:library_app/core/theme/app_styles.dart';
import 'package:library_app/generated/locale_keys.g.dart';

class SaveButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final bool isSaving;

  const SaveButton({
    super.key,
    required this.onPressed,
    this.isSaving = false,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.mainBlue,
          disabledBackgroundColor: Colors.grey[300],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(999.r),
          ),
          minimumSize: Size(48.w, 48.h),
        ),
        child: isSaving
            ? Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 16.w,
                    height: 16.h,
                    child: CircularProgressIndicator(
                      strokeWidth: 2.w,
                      valueColor: const AlwaysStoppedAnimation<Color>(
                        Colors.white,
                      ),
                    ),
                  ),
                  horizontalSpace(8),
                  Text(
                    LocaleKeys.saving_in_progress.tr(),
                    style: AppStyles.font16Gray800SemiBold.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ],
              )
            : Text(
                LocaleKeys.save.tr(),
                style: AppStyles.font16Gray800SemiBold.copyWith(
                  color: onPressed != null ? Colors.white : Colors.grey,
                ),
              ),
      ),
    );
  }
}
