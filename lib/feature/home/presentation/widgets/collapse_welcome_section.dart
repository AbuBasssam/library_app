import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:library_app/feature/home/presentation/widgets/welcome_section.dart';

class CollapseWelcomeSection extends StatelessWidget {
  const CollapseWelcomeSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 160.0.h,
      floating: true,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      elevation: 0,
      flexibleSpace: FlexibleSpaceBar(
        background: const WelcomeSection(),
        collapseMode: CollapseMode.parallax,
      ),
    );
  }
}
