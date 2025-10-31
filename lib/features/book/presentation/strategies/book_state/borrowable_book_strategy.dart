import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/features/book/domain/abstracts/book_state_strategy.dart';
import 'package:library_app/features/book/domain/entities/borrowable_book_status.dart';
import 'package:library_app/features/book/presentation/bloc/book_details_cubit/book_details_cubit.dart';
import 'package:library_app/features/book/presentation/models/borrow_bottom_sheet_info.dart';
import 'package:library_app/features/book/presentation/pages/details_page/widgets/borrowable_book_state_widget.dart';
import 'package:library_app/features/book/presentation/services/bottom_sheet_service.dart';

class BorrowableBookStrategy extends BookStateStrategy {
  final BorrowableBookStatus status;

  BorrowableBookStrategy(this.status);

  @override
  Widget buildWidget(BuildContext context) {
    return BorrowableBookStateWidget(
      onBorrowPressed: () => onPrimaryAction(context),
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

    BottomSheetService.showBorrowSheet(
      context,
      bookInfo: BorrowBottomSheetInfo(
        bookTitle: bookData.title,
        bookAuthor: bookData.author,
      ),
      borrowStatus: status,
    );
  }

  @override
  void onSecondaryAction(BuildContext context) {
    BottomSheetService.showSavedListSheet(context);
  }
}
