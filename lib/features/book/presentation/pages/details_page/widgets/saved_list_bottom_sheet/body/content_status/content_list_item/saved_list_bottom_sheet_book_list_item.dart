import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:library_app/core/helpers/spacing.dart';
import 'package:library_app/core/theme/app_colors.dart';
import 'package:library_app/features/book/presentation/models/book_list.dart';
import 'package:library_app/features/book/presentation/pages/details_page/widgets/saved_list_bottom_sheet/body/content_status/content_list_item/animated_selected_indicator.dart';
import 'package:library_app/features/book/presentation/pages/details_page/widgets/saved_list_bottom_sheet/body/content_status/content_list_item/book_list_image.dart';
import 'package:library_app/features/book/presentation/pages/details_page/widgets/saved_list_bottom_sheet/body/content_status/content_list_item/book_list_name_text.dart';

class SavedListBottomSheetBookListItem extends StatelessWidget {
  final BookListCardModel item;
  final bool isSelected;
  final VoidCallback onTap;

  const SavedListBottomSheetBookListItem({
    super.key,
    required this.item,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final bool isRTL = Directionality.of(context) == TextDirection.rtl;

    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: Duration(milliseconds: 300 + (item.id * 100)),
      curve: Curves.easeOutBack,
      builder: (context, value, child) {
        return Transform.scale(
          scale: value,
          child: Opacity(
            opacity: 0.85,
            child: child,
          ),
        );
      },
      //Book List Card
      child: InkWell(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          width: 165.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(
              color: isSelected ? AppColors.mainBlue : Colors.transparent,
              width: 2.w,
            ),
            boxShadow: isSelected ? [_isSelectedBoxShadow()] : [],
          ),
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Book Cover Image
                  BookListImage(item: item),
                  verticalSpace(8),
                  // List Name
                  BookListNameText(isSelected: isSelected, item: item),
                  verticalSpace(8),
                ],
              ),
              // Selected Indicator with Animation
              Positioned(
                top: 5.h,
                left: isRTL ? null : 5.0.w,
                right: isRTL ? 5.0.w : null,
                child: AnimatedSelectedIndicator(isSelected: isSelected),
              ),
            ],
          ),
        ),
      ),
    );
  }

  BoxShadow _isSelectedBoxShadow() {
    return BoxShadow(
      color: AppColors.mainBlue.withValues(alpha: 0.2),
      blurRadius: 12.r,
      offset: Offset(0, 4.h),
    );
  }
}
