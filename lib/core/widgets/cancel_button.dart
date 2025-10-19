import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:library_app/core/theme/app_styles.dart';
import 'package:library_app/core/theme/font_weight_helper.dart';
import 'package:library_app/generated/locale_keys.g.dart';

class CancelButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const CancelButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(999.r),
        ),
        side: const BorderSide(color: Colors.grey),
        minimumSize: Size(48.w, 48.h),
      ),
      child: Text(
        LocaleKeys.cancel.tr(),
        style: AppStyles.font24Black87Bold.copyWith(
          fontSize: 16.sp,
          fontWeight: FontWeightHelper.semiBold,
          color: onPressed != null ? Colors.black87 : Colors.grey,
        ),
      ),
    );
  }
}
