import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:library_app/core/theme/app_styles.dart';

class BookAuthorText extends StatelessWidget {
  final String vlaue;

  const BookAuthorText({
    super.key,
    required this.vlaue,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      vlaue,
      style: AppStyles.font12Gray600Regular.copyWith(
        fontSize: 13.sp,
        color: Colors.grey,
      ),
    );
  }
}
