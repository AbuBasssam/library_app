import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Secondary action button (Outlined style)
class SecondaryActionButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final String label;
  final Color color;
  final EdgeInsetsGeometry? padding;

  const SecondaryActionButton({
    super.key,
    required this.onPressed,
    required this.icon,
    required this.label,
    this.color = const Color(0xFF2563EB),
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, size: 20.w),
      label: Text(
        label,
        style: const TextStyle(fontWeight: FontWeight.w600),
      ),
      style: OutlinedButton.styleFrom(
        foregroundColor: color,
        padding: padding ?? EdgeInsets.symmetric(vertical: 12.h),
        side: BorderSide(color: color, width: 2.w),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r),
        ),
      ),
    );
  }
}
