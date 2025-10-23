import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:library_app/core/theme/app_colors.dart';

class RadioIndicator extends StatelessWidget {
  final bool isSelected;

  const RadioIndicator({super.key, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: 20.w,
      height: 20.h,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected ? AppColors.blue600 : AppColors.paleGray,
          width: 2.w,
        ),
        color: Colors.white,
      ),
      child: AnimatedScale(
        duration: const Duration(milliseconds: 200),
        scale: isSelected ? 1.0 : 0.0,
        child: Center(
          child: Container(
            width: 10.w,
            height: 10.h,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.blue600,
            ),
          ),
        ),
      ),
    );
  }
}
