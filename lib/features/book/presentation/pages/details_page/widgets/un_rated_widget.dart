import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:library_app/core/helpers/spacing.dart';

class UnRatedWidget extends StatefulWidget {
  const UnRatedWidget({super.key});

  @override
  State<UnRatedWidget> createState() => _UnRatedWidgetState();
}

class _UnRatedWidgetState extends State<UnRatedWidget> {
  late double _currentRating;
  @override
  void initState() {
    _currentRating = 0;
    super.initState();
  }

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
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: Colors.grey[800],
              ),
            ),
          ],
        ),
        verticalSpace(12),
        Text(
          'Have you read this book before? Share your rating',
          style: TextStyle(
            fontSize: 14.sp,
            color: Colors.grey[700],
          ),
        ),
        verticalSpace(12),
        RatingBar.builder(
          initialRating: _currentRating,
          minRating: 1,
          maxRating: 5,
          itemSize: 28.w,
          allowHalfRating: false,
          itemPadding: EdgeInsets.symmetric(horizontal: 4.0.w),
          itemBuilder: (context, index) => Icon(
            index < _currentRating ? Icons.star : Icons.star_border,
            color: index <= _currentRating ? Colors.amber : Colors.grey[400],
          ),
          onRatingUpdate: _ratingUpdate,
        ),
      ],
    );
  }

  void _ratingUpdate(double rating) => setState(() => _currentRating = rating);
}
