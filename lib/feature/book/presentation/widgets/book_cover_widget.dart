import 'package:flutter/material.dart';
import 'package:library_app/feature/book/domain/entities/book_entity.dart';
import 'package:library_app/feature/book/presentation/widgets/home_view_book_image_widget.dart';
import 'package:library_app/feature/book/presentation/widgets/new_banner_widget.dart';

class BookCoverWidget extends StatelessWidget {
  final CoverInfo coverInfo;
  const BookCoverWidget({super.key, required this.coverInfo});

  @override
  Widget build(BuildContext context) {
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
