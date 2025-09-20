import 'package:flutter/material.dart';
import 'package:library_app/core/helper/spacing.dart';
import 'package:library_app/core/theme/app_styles.dart';

class DetailRow extends StatelessWidget {
  final IconData detailIcon;
  final String strDetail;
  const DetailRow({
    super.key,
    required this.detailIcon,
    required this.strDetail,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(detailIcon, size: 16, color: Colors.grey),
        horizontalSpace(4),
        Text(strDetail, style: AppStyles.font14GreyRegular),
      ],
    );
  }
}
