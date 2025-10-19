import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:library_app/features/book/presentation/models/book_list.dart';

class BookListImage extends StatelessWidget {
  final BookListCardModel item;

  const BookListImage({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: '${item.id}',
      child: Container(
        width: 173.w,
        height: 150.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: Colors.grey[200],
        ),
        child: item.coverImage != null
            ? ClipRRect(
                borderRadius: BorderRadius.circular(8.r),
                child: CachedNetworkImage(
                  imageUrl: item.coverImage!,
                  fit: BoxFit.cover,
                  errorWidget: (context, error, stackTrace) {
                    return _defaultBookIcon();
                  },
                ),
              )
            : _defaultBookIcon(),
      ),
    );
  }

  Center _defaultBookIcon() {
    return Center(child: Icon(Icons.book, size: 50.w, color: Colors.grey[400]));
  }
}
