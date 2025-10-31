import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/features/book/domain/abstracts/book_state_strategy.dart';
import 'package:library_app/features/book/domain/entities/borrowed_book_status.dart';
import 'package:library_app/features/book/presentation/bloc/book_details_cubit/book_details_cubit.dart';
import 'package:library_app/features/book/presentation/models/borrow_bottom_sheet_info.dart';
import 'package:library_app/features/book/presentation/pages/details_page/widgets/borrowed_book_state_widget.dart';
import 'package:library_app/features/book/presentation/services/bottom_sheet_service.dart';

class BorrowedBookStrategy extends BookStateStrategy {
  final BorrowedBookStatus status;

  BorrowedBookStrategy(this.status);

  @override
  Widget buildWidget(BuildContext context) {
    return BorrowedBookStateWidget(
      onExtendPressed: () => onPrimaryAction(context),
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

    BottomSheetService.showExtendBorrowSheet(
      context: context,
      config: status,
      sheetInfo: sheetInfo,
    );
  }

  @override
  void onSecondaryAction(BuildContext context) {
    BottomSheetService.showSavedListSheet(context);
  }
}
