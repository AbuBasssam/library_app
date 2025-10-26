import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:library_app/core/helpers/spacing.dart';
import 'package:library_app/core/theme/app_styles.dart';

class CardTitleRow extends StatelessWidget {
  final IconData? icon;
  final double? iconSize;
  final Color? iconColor;
  final String value;
  final TextStyle? valueStyle;
  final double spaceing;
  const CardTitleRow({
    super.key,
    required this.icon,
    required this.value,
    this.iconSize,
    this.iconColor,
    this.valueStyle,
    this.spaceing = 8,
  });

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Icon(icon, size: iconSize?.w ?? 20.w, color: iconColor),
      horizontalSpace(spaceing),
      Text(value, style: valueStyle ?? AppStyles.font15Bold),
    ]);
  }
}
