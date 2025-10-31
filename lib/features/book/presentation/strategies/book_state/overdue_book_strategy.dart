import 'package:flutter/material.dart';
import 'package:library_app/features/book/domain/abstracts/book_state_strategy.dart';
import 'package:library_app/features/book/domain/entities/overdue_book_status.dart';
import 'package:library_app/features/book/presentation/pages/details_page/widgets/overdue_book_state_widget.dart';
import 'package:library_app/features/book/presentation/services/bottom_sheet_service.dart';

class OverdueBookStrategy extends BookStateStrategy {
  final OverdueBookStatus status;

  OverdueBookStrategy(this.status);

  @override
  Widget buildWidget(BuildContext context) {
    return OverdueBookStateWidget(
      stateData: status,
      onWishlistPressed: () => onSecondaryAction(context),
      onFeePayed: () => onPrimaryAction(context),
    );
  }

  @override
  void onPrimaryAction(BuildContext context) {
    // TODO: implement onPrimaryAction
  }

  @override
  void onSecondaryAction(BuildContext context) {
    BottomSheetService.showSavedListSheet(context);
  }
}
