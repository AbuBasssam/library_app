import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'search_section.dart';

class PinnedSearchBar extends StatelessWidget {
  const PinnedSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: _SearchSectionDelegate(height: 80.h),
    );
  }
}

// Custom delegate for  SearchSection
class _SearchSectionDelegate extends SliverPersistentHeaderDelegate {
  final double height;

  _SearchSectionDelegate({required this.height});

  @override
  double get minExtent => height;

  @override
  double get maxExtent => height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: overlapsContent
            ? [
                BoxShadow(
                  color: Colors.black.withAlpha(13),
                  blurRadius: 8.r,
                  offset: const Offset(0, 2),
                ),
              ]
            : null,
      ),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        child: const SearchSection(),
      ),
    );
  }

  @override
  bool shouldRebuild(covariant _SearchSectionDelegate oldDelegate) {
    return oldDelegate.height != height;
  }
}
