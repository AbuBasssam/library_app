import 'package:badges/badges.dart' as badges;
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:library_app/core/helper/localization_helper.dart';
import 'package:library_app/core/theme/app_styles.dart';

class NotificationIcon extends StatelessWidget {
  final int count;
  final VoidCallback? onTap;

  const NotificationIcon({super.key, required this.count, this.onTap});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: badges.Badge(
        position: _getBadgePositionBaseOnLanguage(context),
        showBadge: count > 0,
        badgeStyle: const badges.BadgeStyle(badgeColor: Colors.redAccent),
        badgeContent: _getBadgeContentText(context),
        child: SvgPicture.asset(
          "assets/svgs/notification-bing.svg",
          width: 22.w,
          height: 22.h,
        ),
      ),
      onPressed: onTap,
    );
  }

  Text _getBadgeContentText(BuildContext context) {
    return context.locale.languageCode == 'ar'
        ? Text(
            LocalizationHelper.convertToArabicDigits(count.toString()),
            style: AppStyles.font12WhiteBlod,
          )
        : Text(
            count.toString(),
            style: AppStyles.font12WhiteBlod,
          );
  }

  badges.BadgePosition _getBadgePositionBaseOnLanguage(BuildContext context) {
    return context.locale.languageCode == 'ar'
        ? badges.BadgePosition.topStart(top: -12.h, start: -10.w)
        : badges.BadgePosition.topEnd(top: -12.h, end: -10.w);
  }
}
