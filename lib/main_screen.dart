import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:library_app/features/home/presentation/pages/home_screen_bloc_builder.dart';
import 'package:library_app/features/home/presentation/widgets/tab_button.dart';
import 'package:library_app/generated/locale_keys.g.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int pageIndex = 0;
  List<Widget> pages = [
    HomeScreenBlocBuilder(),
    Center(child: Text("Library Page")),
    Center(child: Text("Profile Page"))
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[pageIndex],
      bottomNavigationBar: NavigationBar(
        height: 82.h,
        destinations: [
          TabButton(
            icon: IconsaxPlusBold.book,
            title: LocaleKeys.Home.tr(),
            isSelected: pageIndex == 0,
            onMenuSelected: () => _changeView(0),
          ),
          TabButton(
            title: LocaleKeys.library.tr(),
            icon: IconsaxPlusLinear.direct,
            isSelected: pageIndex == 1,
            onMenuSelected: () => _changeView(1),
          ),
          TabButton(
            title: LocaleKeys.profile.tr(),
            icon: IconsaxPlusLinear.profile,
            isSelected: pageIndex == 2,
            onMenuSelected: () => _changeView(2),
          ),
        ],
      ),
    );
  }

  void _changeView(int index) => setState(() => pageIndex = index);
}
