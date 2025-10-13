import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:library_app/core/theme/app_colors.dart';
import 'package:library_app/core/theme/app_styles.dart';
import 'package:library_app/generated/locale_keys.g.dart';
import 'dart:ui' as ui;

class ExpandableDescription extends StatefulWidget {
  final String description;

  const ExpandableDescription({
    super.key,
    required this.description,
  });

  @override
  State<ExpandableDescription> createState() => _ExpandableDescriptionState();
}

class _ExpandableDescriptionState extends State<ExpandableDescription> {
  bool isExpanded = false;
  bool needsExpansion = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: const Color(0xFFF9FAFB),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LayoutBuilder(
            builder: (context, constraints) {
              final textSpan = TextSpan(
                text: widget.description,
                style: AppStyles.font14RichBlackRegular.copyWith(
                  fontSize: 15.sp,
                  height: 1.4.h,
                ),
              );

              final textPainter = TextPainter(
                text: textSpan,
                maxLines: 3,
                textDirection: textDirection,
              );

              textPainter.layout(maxWidth: constraints.maxWidth);

              WidgetsBinding.instance.addPostFrameCallback(
                (_) {
                  if (needsExpansion != textPainter.didExceedMaxLines) {
                    setState(() {
                      needsExpansion = textPainter.didExceedMaxLines;
                    });
                  }
                },
              );

              return Text(
                widget.description,
                style: AppStyles.font14RichBlackRegular.copyWith(
                  fontSize: 15.sp,
                  height: 1.4.h,
                ),
                maxLines: isExpanded ? null : 3,
                overflow: isExpanded ? null : TextOverflow.ellipsis,
              );
            },
          ),
          if (needsExpansion || isExpanded) ...[
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextButton(
                  onPressed: () => setState(() => isExpanded = !isExpanded),
                  child: Text(
                    expandText,
                    style: AppStyles.font14RichBlackRegular.copyWith(
                      color: AppColors.blue600,
                    ),
                  ),
                ),
                Icon(
                  isExpanded
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                  color: AppColors.blue600,
                  size: 20.w,
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  ui.TextDirection get textDirection {
    final locale = Localizations.localeOf(context);
    return locale.languageCode == 'ar'
        ? ui.TextDirection.rtl
        : ui.TextDirection.ltr;
  }

  String get expandText {
    return isExpanded ? LocaleKeys.show_less.tr() : LocaleKeys.show_more.tr();
  }
}
