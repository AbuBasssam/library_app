import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:library_app/core/di/dependency_injection.dart';
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
import 'package:library_app/features/book/presentation/models/extending_config.dart';
import 'package:library_app/features/book/presentation/pages/details_page/widgets/borrow_bottom_sheet/borrow_bottom_sheet.dart';
import 'package:library_app/features/book/presentation/pages/details_page/widgets/borrowable_book_state_widget.dart';
import 'package:library_app/features/book/presentation/pages/details_page/widgets/borrowed_book_state_widget.dart';
import 'package:library_app/features/book/presentation/pages/details_page/widgets/extend_borrow_bottom_sheet/extend_borrow_bottom_sheet.dart';
import 'package:library_app/features/book/presentation/pages/details_page/widgets/overdue_book_state_widget.dart';
import 'package:library_app/features/book/presentation/pages/details_page/widgets/reservable_book_state_widget.dart';
import 'package:library_app/features/book/presentation/pages/details_page/widgets/reserved_book_state_widget.dart';
import 'package:library_app/features/book/presentation/pages/details_page/widgets/saved_list_bottom_sheet/saved_list_bottom_sheet.dart';
import 'package:library_app/features/book/presentation/pages/details_page/widgets/unavailable_state_widget.dart';

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
          returnDate: returnDateCalculator(data.dueDate),
          onExtendPressed: () => showExtendBorrowBottomSheet(context),
          onWishlistPressed: () => showSavedToListBottomSheet(context),
        );

      case ReservableBookStatus data:
        return ReservableBookStateWidget(
          // estimatedDays:data.estimatedDays, //5,
          // waitingListCount:data.waitingListCount, // 3,
          stateData: data,
          onReservePressed: () {
            // Handle reserve action
          },
          onWishlistPressed: () => showSavedToListBottomSheet(context),
        );
      case ReservedBookStatus data:
        return ReservedBookStateWidget(
          //remainingTime: Duration(hours: 4, minutes: 30),
          stateData: data,
          onCancelReservation: () {
            // Handle cancel reservation action
          },
          onWishlistPressed: () => showSavedToListBottomSheet(context),
        );

      case OverdueBookStatus data:
        return OverdueBookStateWidget(
          // dueDate: DateTime.now().subtract(Duration(days: 3)),
          // lateFee: 15.75,
          stateData: data,
          onWishlistPressed: () => showSavedToListBottomSheet(context),
        );
      case UnavailableBookStatus _:
        return UnavailableStateWidget(
          onNotifyPressed: () {
            // Handle notify action
          },
          onWishlistPressed: () => showSavedToListBottomSheet(context),
        );
    }
    return BorrowableBookStateWidget(
      onBorrowPressed: () => showExtendBorrowBottomSheet(context),
      onWishlistPressed: () => showSavedToListBottomSheet(context),
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
          //   maxBorrowingDuration: 30,
          //   recommededBorrowingDuration: 18,
          //   finePerDay: 5.0,
          //   pickupRequiredHours: 24,
          //   state: enBookState.borrowable,
          // ),
          onConfirm: (days) {
            // Handle confirmation
            print('Confirmed borrowing for $days days');
          },
        ),
      ),
    );
    // showModalBottomSheet(
    //   context: context,
    //   shape: roundedShape16(),
    //   builder: (sheetContext) => BlocProvider.value(
    //     value: context.read<BookDetailsCubit>(),
    //     child: BorrowBottomSheet(onConfirm: (days) {}),
    //   ),
    // );
  }

  void showExtendBorrowBottomSheet(BuildContext context) {
    final config = ExtendingConfig(
      borrowId: 1,
      canExtend: true,
      borrowDate: DateTime.now().add(Duration(days: -15)),
      dueDate: DateTime.now().add(Duration(days: 3)),
      maxBorrowingDays: 44,
      maxExtensionCount: 2,
      maxExtensionDays: 7,
    );
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
        config: config,
        onConfirm: (value) {
          //TODO: handle Extend Borrow operation
        },
      ),
    );
  }

  RoundedRectangleBorder _topRoundedShape24() {
    return RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
    );
  }

  DateTime returnDateCalculator(DateTime utcDueDate) {
    final localeDueDate = utcDueDate.toLocal();
    final returnDate = DateTime.now().add(
      DateTime.now().difference(localeDueDate),
    );
    return returnDate;
  }

  RoundedRectangleBorder roundedShape16() {
    return RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r));
  }
}
