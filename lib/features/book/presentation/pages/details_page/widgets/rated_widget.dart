import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:library_app/core/helpers/spacing.dart';

class RatedWidget extends StatelessWidget {
  final int rating;
  const RatedWidget({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.star, size: 16.w, color: Colors.grey[700]),
            horizontalSpace(8),
            Text(
              'Rate this book',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.grey[800],
              ),
            ),
          ],
        ),
        verticalSpace(12),
        Row(
          children: [
            Icon(
              Icons.check_circle,
              size: 16.w,
              color: Color(0xFF16A34A),
            ),
            horizontalSpace(8),
            const Text(
              'Thank you! Your rating has been recorded',
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF16A34A),
              ),
            ),
          ],
        ),
        verticalSpace(12),
        RatingBarIndicator(
          rating: rating.toDouble(),
          itemSize: 20.w,
          itemPadding: EdgeInsets.symmetric(horizontal: 2.0.w),
          itemBuilder: (context, _) => Icon(
            Icons.star,
            color: const Color(0xFFEAB308),
          ),
        )
      ],
    );
  }
}
