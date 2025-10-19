import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:library_app/core/theme/app_colors.dart';

class CheckIcon extends StatelessWidget {
  const CheckIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      key: const ValueKey('selected'),
      top: 8.h,
      right: 8.w,
      child: Container(
          width: 24.w,
          height: 24.h,
          decoration: _iconDecoration(),
          child: Icon(Icons.check, size: 16.w, color: Colors.white)),
    );
  }

  BoxDecoration _iconDecoration() {
    return BoxDecoration(
      color: AppColors.mainBlue,
      shape: BoxShape.circle,
      border: Border.all(color: Colors.white, width: 2.w),
    );
  }
}
