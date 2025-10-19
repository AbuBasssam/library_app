import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:library_app/core/helpers/spacing.dart';
import 'package:library_app/features/book/presentation/pages/details_page/widgets/saved_list_bottom_sheet/header/drag_handle.dart';
import 'package:library_app/features/book/presentation/pages/details_page/widgets/saved_list_bottom_sheet/header/title_and_crreate_buttton_row.dart';

class SavedListBottomSheetHeader extends StatelessWidget {
  final VoidCallback? onCreateNewList;

  const SavedListBottomSheetHeader({
    super.key,
    this.onCreateNewList,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 393.w,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: _headerDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DragHandle(),
          verticalSpace(12),
          TitleAndCrreateButttonRow(onCreateNewList: onCreateNewList),
        ],
      ),
    );
  }

  BoxDecoration _headerDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20.r),
        topRight: Radius.circular(20.r),
      ),
    );
  }
}
