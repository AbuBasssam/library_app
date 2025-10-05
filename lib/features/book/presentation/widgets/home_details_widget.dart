import 'package:flutter/material.dart';
import 'package:library_app/core/helpers/spacing.dart';
import 'package:library_app/core/theme/app_styles.dart';

class HomeDetailsWidget extends StatelessWidget {
  final String title;
  final String author;
  const HomeDetailsWidget(
      {super.key, required this.title, required this.author});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppStyles.font14RichBlackBold,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.left,
        ),
        verticalSpace(4),
        Text(
          author,
          style: AppStyles.font12CoolGrayMedium,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.left,
        ),
      ],
    );
  }
}
