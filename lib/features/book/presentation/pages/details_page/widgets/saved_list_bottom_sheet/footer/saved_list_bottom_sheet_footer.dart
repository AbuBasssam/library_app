import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:library_app/core/helpers/spacing.dart';
import 'package:library_app/core/widgets/cancel_button.dart';
import 'package:library_app/core/widgets/save_button.dart';
import 'package:library_app/features/book/presentation/bloc/saved_list_bottom_sheet_cubit/saved_list_bottom_sheet_state.dart';

class SavedListBottomSheetFooter extends StatelessWidget {
  final SavedListBottomSheetState state;
  final VoidCallback onSave;
  final VoidCallback onCancel;

  const SavedListBottomSheetFooter({
    super.key,
    required this.state,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    final isSaving = state is Saving;
    final canSave = state is Loaded;

    return Container(
      width: 393.w,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: const Color(0xFFE0E0E0), width: 1.w),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: CancelButton(onPressed: isSaving ? null : onCancel),
          ),
          horizontalSpace(12),
          Expanded(
            child: SaveButton(
              onPressed: canSave && !isSaving ? onSave : null,
              isSaving: isSaving,
            ),
          ),
        ],
      ),
    );
  }
}
