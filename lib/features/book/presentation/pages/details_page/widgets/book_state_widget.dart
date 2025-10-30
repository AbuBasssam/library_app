import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:library_app/core/di/dependency_injection.dart';
import 'package:library_app/core/helpers/error_state_dialog.dart';
import 'package:library_app/features/book/domain/abstracts/book_repository.dart';
import 'package:library_app/features/book/domain/abstracts/book_status.dart';
import 'package:library_app/features/book/domain/entities/borrowable_book_status.dart';
import 'package:library_app/features/book/domain/entities/borrowed_book_status.dart';
import 'package:library_app/features/book/domain/entities/overdue_book_status.dart';
import 'package:library_app/features/book/domain/entities/reservable_book_status.dart';
import 'package:library_app/features/book/domain/entities/reserved_book_status.dart';
import 'package:library_app/features/book/domain/entities/unavailable_book_status.dart';
import 'package:library_app/features/book/presentation/bloc/book_details_cubit/book_details_cubit.dart';
import 'package:library_app/features/book/presentation/bloc/saved_list_bottom_sheet_cubit/saved_list_bottom_sheet_cubit.dart';
import 'package:library_app/features/book/presentation/models/borrow_bottom_sheet_info.dart';
import 'package:library_app/features/book/presentation/pages/details_page/widgets/borrow_bottom_sheet/borrow_bottom_sheet.dart';
import 'package:library_app/features/book/presentation/pages/details_page/widgets/borrowable_book_state_widget.dart';
import 'package:library_app/features/book/presentation/pages/details_page/widgets/borrowed_book_state_widget.dart';
import 'package:library_app/features/book/presentation/pages/details_page/widgets/extend_borrow_bottom_sheet/extend_borrow_bottom_sheet.dart';
import 'package:library_app/features/book/presentation/pages/details_page/widgets/overdue_book_state_widget.dart';
import 'package:library_app/features/book/presentation/pages/details_page/widgets/reservable_book_state_widget.dart';
import 'package:library_app/features/book/presentation/pages/details_page/widgets/reserve_bottom_sheet/reserve_bottom_sheet.dart';
import 'package:library_app/features/book/presentation/pages/details_page/widgets/reserved_book_state_widget.dart';
import 'package:library_app/features/book/presentation/pages/details_page/widgets/saved_list_bottom_sheet/saved_list_bottom_sheet.dart';
import 'package:library_app/features/book/presentation/pages/details_page/widgets/unavailable_state_widget.dart';
import 'package:library_app/generated/locale_keys.g.dart';

class BookStateWidget extends StatelessWidget {
  final BookStatus bookStatus;
  const BookStateWidget({
    super.key,
    required this.bookStatus,
  });

  @override
  Widget build(BuildContext context) {
    switch (bookStatus) {
      case BorrowableBookStatus data:
        return BorrowableBookStateWidget(
          onBorrowPressed: () => showBorrowBottomSheet(context, data),
          onWishlistPressed: () => showSavedToListBottomSheet(context),
        );
      case BorrowedBookStatus data:
        return BorrowedBookStateWidget(
          onExtendPressed: () => showExtendBorrowBottomSheet(context, data),
          onWishlistPressed: () => showSavedToListBottomSheet(context),
        );

      case ReservableBookStatus data:
        final bookData = context.read<BookDetailsCubit>().saveBookToListData();

        final bookInfo = BorrowBottomSheetInfo(
          bookTitle: bookData!.title,
          bookAuthor: bookData.author,
        );

        return ReservableBookStateWidget(
          stateData: data,
          onReservePressed: () => data.canReserve
              ? showReserveBottomSheet(
                  context,
                  bookInfo: bookInfo,
                  config: data,
                )
              : _showErrorDialog(context),
          onWishlistPressed: () => showSavedToListBottomSheet(context),
        );
      case ReservedBookStatus data:
        return ReservedBookStateWidget(
          stateData: data,
          onCancelReservation: () {
            //TODO: Handle cancel reservation action
          },
          onWishlistPressed: () => showSavedToListBottomSheet(context),
        );

      case OverdueBookStatus data:
        return OverdueBookStateWidget(
          stateData: data,
          onWishlistPressed: () => showSavedToListBottomSheet(context),
        );
      case UnavailableBookStatus _:
        return UnavailableStateWidget(
          onNotifyPressed: () {
            //TODO: Handle notify action
          },
          onWishlistPressed: () => showSavedToListBottomSheet(context),
        );
      default:
        return const SizedBox.shrink();
    }
  }

  Future<dynamic> _showErrorDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (dialogContext) => ErrorStateDialog(
        error: LocaleKeys.reserve_error_max_reached.tr(
          namedArgs: {'count': '3'},
        ),
      ),
    );
  }

  void showSavedToListBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      shape: roundedShape16(),
      builder: (sheetContext) => BlocProvider.value(
        value: context.read<BookDetailsCubit>(),
        child: BlocProvider(
          create: (context) {
            return SavedListBottomSheetCubit(getIt<IBookRepository>())
              ..loadSavedists();
          },
          child: SavedListBottomSheet(),
        ),
      ),
    );
  }

  void showBorrowBottomSheet(BuildContext context, BorrowableBookStatus data) {
    final bookData = context.read<BookDetailsCubit>().saveBookToListData();
    showModalBottomSheet(
      context: context,
      // isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (sheetContext) => BlocProvider.value(
        value: context.read<BookDetailsCubit>(),
        child: BorrowBottomSheet(
          bookInfo: BorrowBottomSheetInfo(
            bookTitle: bookData!.title,
            bookAuthor: bookData.author,
          ),
          config: data,
          onConfirm: (days) {
            //TODO: Handle confirmation
          },
        ),
      ),
    );
  }

  void showExtendBorrowBottomSheet(
      BuildContext context, BorrowedBookStatus data) {
    final bookData = context.read<BookDetailsCubit>().saveBookToListData();
    final bookInfo = BorrowBottomSheetInfo(
      bookTitle: bookData!.title,
      bookAuthor: bookData.author,
    );
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      shape: _topRoundedShape24(),
      builder: (sheetContext) => ExtendBorrowBottomSheet(
        bookInfo: bookInfo,
        config: data,
        onConfirm: (value) {
          //TODO: handle Extend Borrow operation
        },
      ),
    );
  }

  void showReserveBottomSheet(
    BuildContext context, {
    required BorrowBottomSheetInfo bookInfo,
    required ReservableBookStatus config,
    //required VoidCallback onConfirm,
  }) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      shape: _topRoundedShape24(),
      builder: (sheetContext) => BlocProvider.value(
        value: context.read<BookDetailsCubit>(),
        child: ReserveBottomSheet(
          bookInfo: bookInfo,
          config: config,
        ),
      ),
    );
  }

  RoundedRectangleBorder _topRoundedShape24() {
    return RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
    );
  }

  RoundedRectangleBorder roundedShape16() {
    return RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r));
  }
}
