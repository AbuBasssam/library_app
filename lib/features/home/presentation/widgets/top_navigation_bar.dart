import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/core/theme/app_colors.dart';
import 'app_logo.dart';
import 'notification_icon.dart';

class TopNavigationBar extends StatelessWidget {
  final VoidCallback? onNotificationTap;
  final int notificationCount;

  const TopNavigationBar({
    super.key,
    this.onNotificationTap,
    required this.notificationCount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.h,
      color: AppColors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppLogo(),
            NotificationIcon(
              count: notificationCount,
              onTap: onNotificationTap,
            ),
          ],
        ),
      ),
    );
  }
}
