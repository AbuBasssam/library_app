import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookImageWidget extends StatelessWidget {
  final String coverImage;
  final int imageWidth;
  final int imageHeight;
  final int imageRadius;
  const BookImageWidget({
    super.key,
    required this.coverImage,
    this.imageHeight = 200,
    this.imageWidth = 152,
    this.imageRadius = 16,
  });

  @override
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(imageRadius.r),
      child: SizedBox(
        width: imageWidth.w,
        child: AspectRatio(
          aspectRatio: 2 / 3,
          child: CachedNetworkImage(
            imageUrl: coverImage,
            fit: BoxFit.cover,
            alignment: Alignment.center,
          ),
        ),
      ),
    );
  }
}
