import 'package:flutter/material.dart';
import 'package:library_app/features/book/domain/abstracts/book_state_strategy.dart';
import 'package:library_app/features/book/domain/entities/reserved_book_status.dart';
import 'package:library_app/features/book/presentation/pages/details_page/widgets/reserved_book_state_widget.dart';
import 'package:library_app/features/book/presentation/services/bottom_sheet_service.dart';

class ReservedBookStrategy extends BookStateStrategy {
  final ReservedBookStatus status;

  ReservedBookStrategy(this.status);
  @override
  Widget buildWidget(BuildContext context) {
    return ReservedBookStateWidget(
      stateData: status,
      onCancelReservation: () => onPrimaryAction(context),
      onWishlistPressed: () => onSecondaryAction(context),
    );
  }

  @override
  void onPrimaryAction(BuildContext context) {
    // TODO: Handle cancel reservation action
  }

  @override
  void onSecondaryAction(BuildContext context) {
    BottomSheetService.showSavedListSheet(context);
  }
}
