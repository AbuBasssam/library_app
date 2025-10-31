import 'package:flutter/material.dart';
import 'package:library_app/features/book/domain/abstracts/book_state_strategy.dart';
import 'package:library_app/features/book/domain/entities/unavailable_book_status.dart';
import 'package:library_app/features/book/presentation/pages/details_page/widgets/unavailable_state_widget.dart';
import 'package:library_app/features/book/presentation/services/bottom_sheet_service.dart';

class UnavailableBookStrategy extends BookStateStrategy {
  final UnavailableBookStatus status;

  UnavailableBookStrategy(this.status);

  @override
  Widget buildWidget(BuildContext context) {
    return UnavailableStateWidget(
      onNotifyPressed: () => onPrimaryAction(context),
      onWishlistPressed: () => onSecondaryAction(context),
    );
  }

  @override
  void onPrimaryAction(BuildContext context) {
    throw UnimplementedError();
    // TODO: Handle notify action
  }

  @override
  void onSecondaryAction(BuildContext context) {
    BottomSheetService.showSavedListSheet(context);
  }
}
