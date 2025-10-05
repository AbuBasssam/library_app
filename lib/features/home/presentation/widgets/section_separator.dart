import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SectionSeparator extends StatelessWidget {
  const SectionSeparator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 32.h,
      thickness: 32.h,
      color: const Color(0xFFF6F7F9),
    );
  }
}
