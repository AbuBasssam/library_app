import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:library_app/core/helpers/spacing.dart';
import 'package:library_app/features/book/presentation/models/borrow_bottom_sheet_info.dart';
import 'package:library_app/features/book/presentation/models/predefined_option.dart';
import 'package:library_app/features/book/presentation/models/extending_config.dart';
import 'package:library_app/features/book/presentation/pages/details_page/widgets/borrow_bottom_sheet/custom_days_input_section/custom_days_input_section.dart';
import 'package:library_app/features/book/presentation/pages/details_page/widgets/borrow_bottom_sheet/custom_option_card.dart';
import 'package:library_app/features/book/presentation/pages/details_page/widgets/borrow_bottom_sheet/predefined_options_section.dart';
import 'package:library_app/features/book/presentation/pages/details_page/widgets/extend_borrow_bottom_sheet/extend_borrow_bottom_sheet_header.dart';
import 'package:library_app/features/book/presentation/pages/details_page/widgets/extend_borrow_bottom_sheet/extend_current_borrow_card/extend_current_borrow_card.dart';
import 'package:library_app/features/book/presentation/pages/details_page/widgets/extend_borrow_bottom_sheet/extend_details_card.dart';
import 'package:library_app/features/book/presentation/pages/details_page/widgets/extend_borrow_bottom_sheet/extend_warnings_card/extend_warnings_card.dart';
import 'package:library_app/features/book/presentation/pages/details_page/widgets/saved_list_bottom_sheet/header/drag_handle.dart';

class ExtendBorrowBottomSheet extends StatefulWidget {
  final ExtendingConfig config;
  final BorrowBottomSheetInfo bookInfo;
  final ValueChanged<int> onConfirm;

  const ExtendBorrowBottomSheet({
    super.key,
    required this.config,
    required this.bookInfo,
    required this.onConfirm,
  });

  @override
  State<ExtendBorrowBottomSheet> createState() =>
      _ExtendBorrowBottomSheetState();
}

class _ExtendBorrowBottomSheetState extends State<ExtendBorrowBottomSheet>
    with SingleTickerProviderStateMixin {
  late AnimationController _sheetAnimationController;
  late Animation<double> _sheetAnimation;
  int? _selectedDays;
  bool _isCustomInputVisible = false;
  @override
  void initState() {
    super.initState();

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
                  padding:
                      EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ExtendBorrowBottomSheetHeader(info: widget.bookInfo),
                      verticalSpace(24),
                      ExtendCurrentBorrowCard(config: widget.config),
                      verticalSpace(24),
                      PredefinedOptionsSection(
                        options: toBorrowOptionsList(widget.config),
                        selectedDays: _getSelectedDays(),
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
                        child: _isCustomInputVisible
                            ? _CustomDaysInputSection()
                            : const SizedBox.shrink(),
                      ),
                      verticalSpace(24),
                      ExtendDetailsCard(
                        config: widget.config,
                        extendDays: _selectedDays,
                      ),
                      verticalSpace(16),
                      ExtendWarningsCard(config: widget.config)
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

  Column _CustomDaysInputSection() {
    return Column(
      children: [
        verticalSpace(8),
        CustomDaysInputSection(
          maxDays: widget.config.maxAllowedExtendDays,
          onDaysChanged: _handleCustomDaysChanged,
        ),
      ],
    );
  }

  int? _getSelectedDays() => _isCustomInputVisible ? null : _selectedDays;
  List<PredefinedOption> toBorrowOptionsList(ExtendingConfig extendingCnofig) {
    final options = extendingCnofig.predefinedExtendOptions;
    final recommendedDays = extendingCnofig.recommendedExtendDays;
    return options.asMap().entries.map((entry) {
      final days = entry.value;
      final isRecommended = days == recommendedDays;
      return PredefinedOption(days: days, isRecommended: isRecommended);
    }).toList();
  }
}
