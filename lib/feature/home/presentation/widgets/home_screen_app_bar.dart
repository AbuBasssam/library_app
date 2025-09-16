import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:library_app/core/theme/app_colors.dart';
import 'package:library_app/feature/home/presentation/widgets/top_navigation_bar.dart';

class HomeScreenAppBar extends StatelessWidget {
  const HomeScreenAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.white,
      elevation: 0,
      toolbarHeight: 56.h,
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          color: AppColors.white,
          child: TopNavigationBar(
            notificationCount: 3,
            onNotificationTap: () {},
          ),
        ),
      ),
    );
  }
}
