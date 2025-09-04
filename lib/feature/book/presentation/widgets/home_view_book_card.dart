import 'package:flutter/material.dart';
import 'package:library_app/feature/book/presentation/widgets/book_cover_widget.dart';
import '/core/helper/spacing.dart';
import '/core/theme/app_styles.dart';
import '../view models/home_view_info.dart';

class HomeViewBookCard extends StatelessWidget {
  final HomeViewInfo info;
  const HomeViewBookCard({super.key, required this.info});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BookCoverWidget(coverInfo: info.coverInfo),
        verticalSpace(8),
        Text(info.title, style: AppStyles.font14RichBlackBold),
        verticalSpace(4),
        Text(info.author, style: AppStyles.font12CoolGrayMedium),
      ],
    );
  }
}
