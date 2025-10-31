import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:library_app/core/di/dependency_injection.dart';
import 'package:library_app/core/helpers/error_state_dialog.dart';
import 'package:library_app/features/book/domain/abstracts/book_repository.dart';
import 'package:library_app/features/book/domain/entities/borrowable_book_status.dart';
import 'package:library_app/features/book/domain/entities/borrowed_book_status.dart';
import 'package:library_app/features/book/domain/entities/reservable_book_status.dart';
import 'package:library_app/features/book/presentation/bloc/book_details_cubit/book_details_cubit.dart';
import 'package:library_app/features/book/presentation/bloc/saved_list_bottom_sheet_cubit/saved_list_bottom_sheet_cubit.dart';
import 'package:library_app/features/book/presentation/models/borrow_bottom_sheet_info.dart';
import 'package:library_app/features/book/presentation/pages/details_page/widgets/borrow_bottom_sheet/borrow_bottom_sheet.dart';
import 'package:library_app/features/book/presentation/pages/details_page/widgets/extend_borrow_bottom_sheet/extend_borrow_bottom_sheet.dart';
import 'package:library_app/features/book/presentation/pages/details_page/widgets/reserve_bottom_sheet/reserve_bottom_sheet.dart';
import 'package:library_app/features/book/presentation/pages/details_page/widgets/saved_list_bottom_sheet/saved_list_bottom_sheet.dart';

class BottomSheetService {
  BottomSheetService._();

  static void showBorrowSheet(
    BuildContext context, {
    required BorrowBottomSheetInfo bookInfo,
    required BorrowableBookStatus borrowStatus,
  }) {
    showModalBottomSheet(
      context: context,
      shape: _topRoundedShape24(),
      builder: (sheetContext) => BlocProvider.value(
        value: context.read<BookDetailsCubit>(),
        child: BorrowBottomSheet(
          bookInfo: bookInfo,
          config: borrowStatus,
          onConfirm: (days) {
            // TODO: Handle  Borrowing action
          },
        ),
      ),
    );
  }

  static void showSavedListSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      shape: _roundedShape16(),
      isScrollControlled: true,
      builder: (sheetContext) => BlocProvider.value(
        value: context.read<BookDetailsCubit>(),
        child: BlocProvider(
          create: (context) =>
              SavedListBottomSheetCubit(getIt<IBookRepository>())
                ..loadSavedists(),
          child: SavedListBottomSheet(),
        ),
      ),
    );
  }

  static void showExtendBorrowSheet({
    required BuildContext context,
    required BorrowedBookStatus config,
    required BorrowBottomSheetInfo sheetInfo,
  }) {
    final bookInfo = sheetInfo;

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      shape: _topRoundedShape24(),
      builder: (sheetContext) => BlocProvider.value(
        value: context.read<BookDetailsCubit>(),
        child: ExtendBorrowBottomSheet(
          bookInfo: bookInfo,
          config: config,
          onConfirm: (value) {
            //TODO: handle Extend Borrow operation
          },
        ),
      ),
    );
  }

  static void showReserveBottomSheet(
    BuildContext context, {
    required BorrowBottomSheetInfo bookInfo,
    required ReservableBookStatus config,
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
          onReserve: () {
            //TODO: Handle Reserve Confirm Action
            GoRouter.of(context).pop();
          },
        ),
      ),
    );
  }

  static Future<dynamic> showErrorDialog(BuildContext context, String error) {
    return showDialog(
      context: context,
      builder: (dialogContext) => ErrorStateDialog(error: error),
    );
  }

  static RoundedRectangleBorder _topRoundedShape24() {
    return RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
    );
  }

  static RoundedRectangleBorder _roundedShape16() {
    return RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16.r),
    );
  }
}
