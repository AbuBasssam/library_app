import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:library_app/core/helpers/spacing.dart';
import 'package:library_app/core/theme/app_colors.dart';
import 'package:library_app/core/theme/app_styles.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({super.key, required this.percentage});

  final double percentage;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 8.h,
            decoration: BoxDecoration(
              color: AppColors.lightGray,
              borderRadius: BorderRadius.circular(4.r),
            ),
            child: AnimatedFractionallySizedBox(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOutCubic,
              alignment: Alignment.centerRight,
              widthFactor: percentage,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.blue600,
                  borderRadius: BorderRadius.circular(4.r),
                ),
              ),
            ),
          ),
        ),
        horizontalSpace(12),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          transitionBuilder: (child, animation) {
            return ScaleTransition(
              scale: animation,
              child: child,
            );
          },
          child: Text(
            '${(percentage * 100).round()}%',
            key: ValueKey<int>((percentage * 100).round()),
            style: AppStyles.font12CoolGrayMedium.copyWith(
              color: Colors.black54,
            ),
          ),
        ),
      ],
    );
  }
}
