import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:library_app/core/helpers/spacing.dart';
import 'package:library_app/core/theme/app_colors.dart';
import 'package:library_app/features/book/domain/entities/reservable_book_status.dart';
import 'package:library_app/features/book/presentation/models/borrow_bottom_sheet_info.dart';
import 'package:library_app/features/book/presentation/pages/details_page/widgets/bottom_sheet_action_buttons.dart';
import 'package:library_app/features/book/presentation/pages/details_page/widgets/reserve_bottom_sheet/queue_status_card.dart';
import 'package:library_app/features/book/presentation/pages/details_page/widgets/reserve_bottom_sheet/reserve_bottom_sheet_header.dart';
import 'package:library_app/features/book/presentation/pages/details_page/widgets/reserve_bottom_sheet/reserve_policies_card.dart';
import 'package:library_app/features/book/presentation/pages/details_page/widgets/saved_list_bottom_sheet/header/drag_handle.dart';
import 'package:library_app/generated/locale_keys.g.dart';

class ReserveBottomSheet extends StatefulWidget {
  final BorrowBottomSheetInfo bookInfo;
  final ReservableBookStatus config;
  final VoidCallback onReserve;

  const ReserveBottomSheet(
      {super.key,
      required this.bookInfo,
      required this.config,
      required this.onReserve});

  @override
  State<ReserveBottomSheet> createState() => _ReserveBottomSheetState();
}

class _ReserveBottomSheetState extends State<ReserveBottomSheet>
    with SingleTickerProviderStateMixin {
  late AnimationController _sheetAnimationController;
  late Animation<double> _sheetAnimation;

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
                      ReserveBottomSheetHeader(info: widget.bookInfo),
                      verticalSpace(24),
                      QueueStatusCard(config: widget.config),
                      verticalSpace(16),
                      ReservePoliciesCard(config: widget.config),
                      verticalSpace(24),
                      BottomSheetActionButtons(
                        primaryValue: LocaleKeys.reserve_confirm.tr(),
                        primaryColor: AppColors.orange600,
                        primaryAction: widget.onReserve,
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
}
