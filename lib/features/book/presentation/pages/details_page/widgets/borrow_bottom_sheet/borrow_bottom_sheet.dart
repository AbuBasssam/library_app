import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:library_app/core/helpers/spacing.dart';
import 'package:library_app/features/book/domain/entities/book_status.dart';
import 'package:library_app/features/book/presentation/models/borrow_bottom_sheet_info.dart';
import 'package:library_app/features/book/presentation/models/borrow_option.dart';
import 'package:library_app/features/book/presentation/pages/details_page/widgets/borrow_bottom_sheet/borrow_action_buttons.dart';
import 'package:library_app/features/book/presentation/pages/details_page/widgets/borrow_bottom_sheet/borrow_bottom_sheet_header.dart';
import 'package:library_app/features/book/presentation/pages/details_page/widgets/borrow_bottom_sheet/borrowing_details_card/borrowing_details_card.dart';
import 'package:library_app/features/book/presentation/pages/details_page/widgets/borrow_bottom_sheet/borrowing_warnings_card/borrowing_warnings_card.dart';
import 'package:library_app/features/book/presentation/pages/details_page/widgets/borrow_bottom_sheet/custom_days_input_section/custom_days_input_section.dart';
import 'package:library_app/features/book/presentation/pages/details_page/widgets/borrow_bottom_sheet/custom_option_card.dart';
import 'package:library_app/features/book/presentation/pages/details_page/widgets/borrow_bottom_sheet/predefined_options_section.dart';
import 'package:library_app/features/book/presentation/pages/details_page/widgets/saved_list_bottom_sheet/header/drag_handle.dart';

class BorrowBottomSheet extends StatefulWidget {
  final BorrowBottomSheetInfo bookInfo;
  final BookStatus config;
  final ValueChanged<int> onConfirm;

  const BorrowBottomSheet({
    super.key,
    required this.bookInfo,
    required this.config,
    required this.onConfirm,
  });

  @override
  State<BorrowBottomSheet> createState() => _BorrowBottomSheetState();
}

class _BorrowBottomSheetState extends State<BorrowBottomSheet>
    with SingleTickerProviderStateMixin {
  int? _selectedDays;
  bool _isCustomInputVisible = false;
  late AnimationController _sheetAnimationController;
  late Animation<double> _sheetAnimation;

  late final List<BorrowOption> _predefinedOptions;

  @override
  void initState() {
    super.initState();
    _predefinedOptions = [
      // Minimum option
      BorrowOption(days: (widget.config.maxBorrowingDuration! / 3).ceil()),

      // Recommeded option
      BorrowOption(
        days: widget.config.recommededBorrowingDuration!,
        isRecommended: true,
      ),

      //maximum option
      BorrowOption(days: widget.config.maxBorrowingDuration!),
    ];

    _sheetAnimationController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    _sheetAnimation = CurvedAnimation(
      parent: _sheetAnimationController,
      curve: Curves.easeOutCubic,
    );

    _sheetAnimationController.forward();
  }

  @override
  void dispose() {
    _sheetAnimationController.dispose();
    super.dispose();
  }

  void _handlePredefinedOptionSelected(int days) {
    setState(() {
      _isCustomInputVisible = false;
      _selectedDays = days;
    });
  }

  void _handleCustomInputToggled() {
    setState(() {
      _isCustomInputVisible = true;
      _selectedDays = null;
    });
  }

  void _handleCustomDaysChanged(int? days) {
    setState(() => _selectedDays = days);
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _sheetAnimation,
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, 0.1),
          end: Offset.zero,
        ).animate(_sheetAnimation),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DragHandle(margin: EdgeInsets.only(top: 12.h, bottom: 8.h)),
              // Content
              Flexible(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(
                    horizontal: 24.w,
                    vertical: 24.h,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      BorrowBottomSheetHeader(info: widget.bookInfo),
                      verticalSpace(24),
                      PredefinedOptionsSection(
                        options: _predefinedOptions,
                        selectedDays:
                            _isCustomInputVisible ? null : _selectedDays,
                        onOptionSelected: _handlePredefinedOptionSelected,
                      ),
                      verticalSpace(12),
                      CustomOptionCard(
                        isSelected: _isCustomInputVisible,
                        onTap: _handleCustomInputToggled,
                      ),
                      AnimatedSize(
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeInOut,
                        child: _customInputTextField(),
                      ),
                      verticalSpace(24),
                      BorrowingDetailsCard(days: _selectedDays),
                      verticalSpace(16),
                      BorrowingWarningsCard(
                        pickupRequiredHours: widget.config.pickupRequiredHours!,
                        finePerDay: widget.config.finePerDay!,
                      ),
                      verticalSpace(24),
                      BorrowActionButtons(
                        selectedDays: _selectedDays,
                        onConfirm: widget.onConfirm,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  RenderObjectWidget _customInputTextField() {
    return _isCustomInputVisible
        ? Column(
            children: [
              verticalSpace(8),
              CustomDaysInputSection(
                maxDays: widget.config.maxBorrowingDuration!,
                onDaysChanged: _handleCustomDaysChanged,
              ),
            ],
          )
        : const SizedBox.shrink();
  }
}
