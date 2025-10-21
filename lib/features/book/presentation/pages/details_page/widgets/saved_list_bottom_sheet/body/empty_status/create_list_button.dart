import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:library_app/core/helpers/helper_methods.dart';
import 'package:library_app/core/theme/app_colors.dart';
import 'package:library_app/core/theme/app_styles.dart';
import 'package:library_app/generated/locale_keys.g.dart';

class CreateListButton extends StatelessWidget {
  const CreateListButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        style: _btnStyle(),
        onPressed: () => showCreateListDialog(context),
        icon: const Icon(Icons.add, color: Colors.white),
        label: Text(
          LocaleKeys.create_new_list.tr(),
          style: AppStyles.font16Gray800SemiBold.copyWith(color: Colors.white),
        ),
      ),
    );
  }

  ButtonStyle _btnStyle() {
    return ElevatedButton.styleFrom(
      backgroundColor: AppColors.mainBlue,
      padding: EdgeInsets.symmetric(vertical: 14.h),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
      ),
      elevation: 0,
    );
  }
}
