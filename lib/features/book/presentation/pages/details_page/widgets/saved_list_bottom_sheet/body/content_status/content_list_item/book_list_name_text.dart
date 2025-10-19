import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:library_app/core/theme/app_colors.dart';
import 'package:library_app/core/theme/app_styles.dart';
import 'package:library_app/core/theme/font_weight_helper.dart';
import 'package:library_app/features/book/presentation/models/book_list.dart';

class BookListNameText extends StatelessWidget {
  final bool isSelected;
  final BookListCardModel item;

  const BookListNameText({
    super.key,
    required this.isSelected,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: AnimatedDefaultTextStyle(
        duration: const Duration(milliseconds: 200),
        style: AppStyles.font14RichBlackRegular.copyWith(
          fontWeight: _txtWeight(),
          color: _txtColor(),
        ),
        child: Text(
          item.name,
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }

  Color _txtColor() => isSelected ? AppColors.mainBlue : Colors.black87;

  FontWeight _txtWeight() {
    return isSelected ? FontWeightHelper.semiBold : FontWeightHelper.medium;
  }
}
