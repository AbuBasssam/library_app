import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnimatedGradientCard extends StatelessWidget {
  final List<Color> gradientColors;
  final Color borderColor;
  final EdgeInsets? padding;
  final Widget content;
  const AnimatedGradientCard({
    super.key,
    required this.gradientColors,
    required this.borderColor,
    this.padding,
    required this.content,
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
        padding: padding ?? _cardPadding(),
        decoration: _cardDecoration(),
        child: content,
      ),
    );
  }

  EdgeInsets _cardPadding() {
    return EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h);
  }

  BoxDecoration _cardDecoration() {
    return BoxDecoration(
      gradient: LinearGradient(colors: gradientColors),
      border: Border.all(color: borderColor),
      borderRadius: BorderRadius.circular(12.r),
    );
  }
}
