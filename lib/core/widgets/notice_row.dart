import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:library_app/core/theme/app_styles.dart';
import 'package:library_app/core/theme/font_weight_helper.dart';

class NoticeRow extends StatelessWidget {
  final EdgeInsets? padding;
  final String value;
  final String? highlightText;

  final Color? valueColor;
  final bool isBold;

  const NoticeRow({
    super.key,
    required this.value,
    this.isBold = false,
    this.valueColor,
    this.padding,
    this.highlightText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.only(bottom: 8.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '• ',
            style: AppStyles.font14Gray700Regular.copyWith(
              color: valueColor,
            ),
          ),
          Expanded(
            child: highlightText != null
                ? buildHighlightedText()
                : Text(
                    value,
                    style: AppStyles.font14Gray700Regular.copyWith(
                      color: valueColor,
                      fontSize: 13.sp,
                      fontWeight: isBold
                          ? FontWeightHelper.bold
                          : FontWeightHelper.regular,
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  Widget buildHighlightedText() {
    final parts = value.split(highlightText!);

    if (parts.length == 1) {
      return Text(
        value,
        style: AppStyles.font14GreyRegular
            .copyWith(fontSize: 13.sp, color: valueColor),
      );
    }

    return Text.rich(
      TextSpan(
        style: AppStyles.font14GreyRegular
            .copyWith(fontSize: 13.sp, color: valueColor),
        children: [
          TextSpan(text: parts[0]),
          TextSpan(
            text: highlightText,
            style: AppStyles.font15Bold.copyWith(
              fontSize: 14.sp,
            ),
          ),
          if (parts.length > 1) TextSpan(text: parts[1]),
        ],
      ),
    );
  }
}
