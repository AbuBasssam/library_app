import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomeSection extends StatelessWidget {
  const WelcomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/WelcomeToBookWord.jpg',
      width: double.infinity,
      height: 160.h,
      fit: BoxFit.cover,
    );
  }
}
