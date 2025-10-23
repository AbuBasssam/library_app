import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DragHandle extends StatelessWidget {
  final EdgeInsetsGeometry? margin;
  const DragHandle({super.key, this.margin});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: 40.w,
      height: 4.h,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(2.r),
      ),
    );
  }
}
