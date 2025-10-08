import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:library_app/core/helpers/app_strings.dart';

class WelcomeSection extends StatelessWidget {
  const WelcomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppStrings.imgWelcom,
      width: double.infinity,
      height: 160.h,
      fit: BoxFit.cover,
    );
  }
}
