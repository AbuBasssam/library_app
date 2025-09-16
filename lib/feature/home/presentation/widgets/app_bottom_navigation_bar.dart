import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:library_app/feature/home/presentation/widgets/menu_item.dart';
import 'package:library_app/generated/locale_keys.g.dart';

class AppBottomNavigationBar extends StatelessWidget {
  const AppBottomNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFF6F7F9),
      height: 90.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          MenuItem(
            icon: IconsaxPlusBold.book,
            title: LocaleKeys.Home.tr(),
            onMenuSelected: () {},
            isSelected: true,
          ),
          MenuItem(
            title: LocaleKeys.library.tr(),
            icon: IconsaxPlusLinear.direct,
            onMenuSelected: () {},
          ),
          MenuItem(
            title: LocaleKeys.profile.tr(),
            icon: IconsaxPlusLinear.profile,
            onMenuSelected: () {},
          ),
        ],
      ),
    );
  }
}
