import 'package:flutter/material.dart';
import '/core/helper/spacing.dart';
import '/core/theme/app_styles.dart';
import './home_view_book_image_widget.dart';
import './new_banner_widget.dart';
import '../../domain/entities/book_entity.dart';
import '../view models/home_view_info.dart';

class HomeViewBookCard extends StatelessWidget {
  final HomeViewInfo info;
  const HomeViewBookCard({super.key, required this.info});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildCover(info.coverInfo),
        verticalSpace(8),
        Text(info.title, style: AppStyles.font14RichBlackBold),
        verticalSpace(4),
        Text(info.author, style: AppStyles.font12CoolGrayMedium),
      ],
    );
  }

  Widget _buildCover(CoverInfo coverInfo) {
    if (!coverInfo.isNew) {
      return HomeViewBookImageWidget(coverImage: coverInfo.coverImage);
    }
    return Stack(
      children: [
        HomeViewBookImageWidget(coverImage: coverInfo.coverImage),
        const NewBannerWidget(),
      ],
    );
  }
}
