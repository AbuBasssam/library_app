import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:library_app/core/helpers/extension.dart';
import 'package:library_app/core/theme/app_styles.dart';
import 'package:library_app/features/book/domain/entities/en_book_state.dart';

class BookStatusBadge extends StatelessWidget {
  final enBookState state;

  const BookStatusBadge({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120.w,
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: state.backgroundColor,
        border: Border.all(color: state.borderColor),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            state.displayText,
            style: AppStyles.font14SemiBold.copyWith(
              fontSize: 13,
              color: state.textColor,
            ),
          ),
          Icon(
            state.icon,
            size: 16.w,
            color: state.textColor,
          ),
        ],
      ),
    );
  }
}
