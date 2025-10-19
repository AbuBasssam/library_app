import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:library_app/features/book/presentation/models/book_list.dart';
import 'content_list_item/saved_list_bottom_sheet_book_list_item.dart';

class SavedListBottomSheetBookLists extends StatelessWidget {
  final List<BookListCardModel> content;
  final int selectedIndex;
  final Function(int) onSelectList;

  const SavedListBottomSheetBookLists({
    super.key,
    required this.content,
    required this.selectedIndex,
    required this.onSelectList,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxHeight: 400.h),
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        child: Wrap(
          spacing: 12.w,
          runSpacing: 12.w,
          children: List.generate(
            content.length,
            (index) => SavedListBottomSheetBookListItem(
              item: content[index],
              isSelected: index == selectedIndex,
              onTap: () => onSelectList(index),
            ),
          ),
        ),
      ),
    );
  }
}
