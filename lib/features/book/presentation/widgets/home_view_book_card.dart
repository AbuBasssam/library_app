import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:library_app/features/book/presentation/widgets/book_cover_widget.dart';
import 'package:library_app/features/book/presentation/widgets/home_details_widget.dart';
import '../view models/home_view_info.dart';
import '../../../../core/helpers/spacing.dart';

class HomeViewBookCard extends StatelessWidget {
  final HomeViewInfo info;
  const HomeViewBookCard({super.key, required this.info});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BookCoverWidget(coverInfo: info.coverInfo),
        verticalSpace(8),
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 160.w),
          child: HomeDetailsWidget(
            title: info.title,
            author: info.author,
          ),
        ),
      ],
    );
  }
}
