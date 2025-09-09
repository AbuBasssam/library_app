import 'package:flutter/material.dart';
import 'package:library_app/feature/book/domain/entities/book_cover_style.dart';
import 'package:library_app/feature/book/domain/entities/cover_info.dart';
import 'package:library_app/feature/book/presentation/widgets/book_image_widget.dart';
import 'package:library_app/feature/book/presentation/widgets/new_banner_widget.dart';

class BookCoverWidget extends StatelessWidget {
  final CoverInfo coverInfo;
  final BookCoverStyle coverStyle;
  const BookCoverWidget({
    super.key,
    required this.coverInfo,
    this.coverStyle = const BookCoverStyle(),
  });

  @override
  Widget build(BuildContext context) {
    if (!coverInfo.isNew) {
      return BookImageWidget(
        coverImage: coverInfo.coverImage,
        imageHeight: coverStyle.imageHeight,
        imageWidth: coverStyle.imageWidth,
        imageRadius: coverStyle.imageRadius,
      );
    }
    return Stack(
      children: [
        BookImageWidget(
          coverImage: coverInfo.coverImage,
          imageHeight: coverStyle.imageHeight,
          imageWidth: coverStyle.imageWidth,
          imageRadius: coverStyle.imageRadius,
        ),
        NewBannerWidget(
          horizontalPadding: coverStyle.bannerHorizontalPadding,
          verticalPadding: coverStyle.bannerVerticalPadding,
          borderRadius: coverStyle.bannerBorderRadius,
        ),
      ],
    );
  }
}
