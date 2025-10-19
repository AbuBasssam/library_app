import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:library_app/core/helpers/spacing.dart';
import 'package:library_app/core/theme/app_colors.dart';
import 'package:library_app/core/theme/app_styles.dart';
import 'package:library_app/generated/locale_keys.g.dart';

class TitleAndCrreateButttonRow extends StatelessWidget {
  final VoidCallback? onCreateNewList;

  const TitleAndCrreateButttonRow({
    super.key,
    required this.onCreateNewList,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            LocaleKeys.add_to_list.tr(),
            style: AppStyles.font24Black87Bold.copyWith(fontSize: 20.sp),
          ),
        ),
        InkWell(
          onTap: onCreateNewList,
          borderRadius: BorderRadius.circular(8.r),
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 12.w,
              vertical: 6.h,
            ),
            decoration: _btnDecoration(),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // plus icon
                Icon(
                  Icons.add,
                  size: 18.w,
                  color: AppColors.mainBlue,
                ),
                horizontalSpace(4),
                Text(
                  LocaleKeys.create_new_list.tr(),
                  style: AppStyles.font14Blue600SemiBold.copyWith(
                    color: AppColors.mainBlue,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  BoxDecoration _btnDecoration() {
    return BoxDecoration(
      color: AppColors.mainBlue.withValues(alpha: 0.1),
      borderRadius: BorderRadius.circular(8.r),
    );
  }
}
