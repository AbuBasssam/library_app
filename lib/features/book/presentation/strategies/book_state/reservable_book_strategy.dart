import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/features/book/domain/abstracts/book_state_strategy.dart';
import 'package:library_app/features/book/domain/entities/reservable_book_status.dart';
import 'package:library_app/features/book/presentation/bloc/book_details_cubit/book_details_cubit.dart';
import 'package:library_app/features/book/presentation/models/borrow_bottom_sheet_info.dart';
import 'package:library_app/features/book/presentation/pages/details_page/widgets/reservable_book_state_widget.dart';
import 'package:library_app/features/book/presentation/services/bottom_sheet_service.dart';

class ReservableBookStrategy extends BookStateStrategy {
  final ReservableBookStatus status;

  ReservableBookStrategy(this.status);

  @override
  Widget buildWidget(BuildContext context) {
    return ReservableBookStateWidget(
      stateData: status,
      onReservePressed: () => status.canReserve
          ? onPrimaryAction(context)
          : BottomSheetService.showErrorDialog(context, status.disableReason!),
      onWishlistPressed: () => onSecondaryAction(context),
    );
  }

  @override
  void onPrimaryAction(BuildContext context) {
    final cubit = context.read<BookDetailsCubit>();
    final bookData = cubit.saveBookToListData();
    if (bookData == null) {
      BottomSheetService.showErrorDialog(context, 'null object');

      return;
    }

    BorrowBottomSheetInfo sheetInfo = BorrowBottomSheetInfo(
      bookTitle: bookData.title,
      bookAuthor: bookData.author,
    );
    BottomSheetService.showReserveBottomSheet(
      context,
      bookInfo: sheetInfo,
      config: status,
    );
  }

  @override
  void onSecondaryAction(BuildContext context) {
    BottomSheetService.showSavedListSheet(context);
  }
}
