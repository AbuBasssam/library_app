import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:library_app/core/theme/app_styles.dart';
import 'package:library_app/generated/locale_keys.g.dart';

class EmptyListTitle extends StatelessWidget {
  const EmptyListTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      LocaleKeys.no_lists_yet.tr(),
      style: AppStyles.font18Yellow900Bold.copyWith(color: Colors.black87),
      textAlign: TextAlign.center,
    );
  }
}
