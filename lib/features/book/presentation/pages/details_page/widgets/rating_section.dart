import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:library_app/features/book/presentation/pages/details_page/widgets/rated_widget.dart';
import 'package:library_app/features/book/presentation/pages/details_page/widgets/un_rated_widget.dart';

class RatingSection extends StatelessWidget {
  final int rating;

  const RatingSection({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: rating == 0 ? UnRatedWidget() : RatedWidget(rating: rating),
    );
  }
}
