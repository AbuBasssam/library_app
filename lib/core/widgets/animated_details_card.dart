import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnimatedDetailsCard extends StatelessWidget {
  final Color? cardColor;
  final Color borderColor;
  final EdgeInsets? padding;

  final Widget content;
  const AnimatedDetailsCard({
    super.key,
    required this.borderColor,
    required this.cardColor,
    required this.content,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 500),
      tween: Tween(begin: 0.0, end: 1.0),
      curve: Curves.easeOutCubic,
      builder: (context, value, child) {
        return Transform.scale(
          scale: 0.9 + (0.1 * value),
          child: Opacity(opacity: value, child: child),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        decoration: _cardDecoration(),
        child: content,
      ),
    );
  }

  BoxDecoration _cardDecoration() {
    return BoxDecoration(
      color: cardColor,
      border: Border.all(color: borderColor),
      borderRadius: BorderRadius.circular(12.r),
    );
  }
}
