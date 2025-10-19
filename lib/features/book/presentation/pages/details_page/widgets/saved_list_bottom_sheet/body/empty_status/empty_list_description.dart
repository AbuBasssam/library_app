import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:library_app/core/theme/app_styles.dart';
import 'package:library_app/generated/locale_keys.g.dart';

class EmptyListDescription extends StatelessWidget {
  const EmptyListDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      LocaleKeys.create_first_list.tr(),
      style: AppStyles.font14RichBlackRegular.copyWith(
        color: Colors.grey[600],
        height: 1.5.h,
      ),
      textAlign: TextAlign.center,
    );
  }
}
