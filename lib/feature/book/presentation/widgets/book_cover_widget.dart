import 'package:flutter/material.dart';
import 'package:library_app/feature/book/domain/entities/cover_info.dart';
import 'package:library_app/feature/book/presentation/widgets/book_image_widget.dart';
import 'package:library_app/feature/book/presentation/widgets/new_banner_widget.dart';

class BookCoverWidget extends StatelessWidget {
  final CoverInfo coverInfo;
  final int imageWidth;
  final int imageHeight;
  final int imageRadius;
  const BookCoverWidget({
    super.key,
    required this.coverInfo,
    this.imageHeight = 200,
    this.imageWidth = 152,
    this.imageRadius = 16,
  });

  @override
  Widget build(BuildContext context) {
    if (!coverInfo.isNew) {
      return BookImageWidget(
        coverImage: coverInfo.coverImage,
        imageHeight: imageHeight,
        imageWidth: imageWidth,
      );
    }
    return Stack(
      children: [
        BookImageWidget(
          coverImage: coverInfo.coverImage,
          imageHeight: imageHeight,
          imageWidth: imageWidth,
        ),
        const NewBannerWidget(),
      ],
    );
  }
}
