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
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(imageRadius.r),
      child: _cacheVersion(),
    );
  }

  Widget _cacheVersion() {
    return CachedNetworkImage(
      imageUrl: coverImage,
      fit: BoxFit.cover,
      width: imageWidth.w,
      height: imageHeight.h,
    );
  }

  /*Widget _networkVersion() {
    return Image.network(
      coverImage,
      fit: BoxFit.cover,
      width: imageWidth.w,
      height: imageHeight.h,
    );
  }*/
}
