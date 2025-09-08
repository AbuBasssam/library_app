import 'package:flutter/material.dart';
import 'package:library_app/core/helper/spacing.dart';
import 'package:library_app/core/theme/app_styles.dart';

class RatintgRowWidget extends StatelessWidget {
  final double rating;

  const RatintgRowWidget({
    super.key,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    double diplayRating = (rating * 10).roundToDouble() / 10;
    return Row(
      children: [
        Text(
          diplayRating.toStringAsFixed(1),
          style: AppStyles.font14RichBlackBold,
        ),
        horizontalSpace(4),
        const Icon(Icons.star, color: Colors.amber, size: 20),
      ],
    );
  }
}
