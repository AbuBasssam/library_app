import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:library_app/core/helpers/snack_bar_messages.dart';
import 'package:library_app/features/book/presentation/bloc/book_details_cubit/book_details_cubit.dart';
import 'package:library_app/features/book/presentation/bloc/saved_list_bottom_sheet_cubit/saved_list_bottom_sheet_cubit.dart';
import 'package:library_app/features/book/presentation/bloc/saved_list_bottom_sheet_cubit/saved_list_bottom_sheet_state.dart';
import 'package:library_app/features/book/presentation/models/book_list_data.dart';
import 'package:library_app/features/book/presentation/pages/details_page/widgets/saved_list_bottom_sheet/footer/saved_list_bottom_sheet_footer.dart';
import 'package:library_app/features/book/presentation/pages/details_page/widgets/saved_list_bottom_sheet/header/saved_list_bottom_sheet_header.dart';
import 'package:library_app/features/book/presentation/pages/details_page/widgets/saved_list_bottom_sheet/saved_list_bottom_sheet_content.dart';

class SavedListBottomSheet extends StatefulWidget {
  const SavedListBottomSheet({super.key});

  @override
  State<SavedListBottomSheet> createState() => _SavedListBottomSheetState();
}

class _SavedListBottomSheetState extends State<SavedListBottomSheet>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    )..forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SavedListBottomSheetCubit, SavedListBottomSheetState>(
      listener: _handleStateChanges,
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) => SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, 1),
            end: Offset.zero,
          ).animate(
            CurvedAnimation(
              parent: _animationController,
              curve: Curves.easeOutCubic,
            ),
          ),
          child: FadeTransition(
            opacity: _animationController,
            child: child,
          ),
        ),
        child: Container(
          width: double.infinity,
          decoration: _bsDecoration(),
          child:
              BlocBuilder<SavedListBottomSheetCubit, SavedListBottomSheetState>(
            builder: (context, state) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SavedListBottomSheetHeader(),
                  SavedListBottomSheetContent(state: state),
                  SavedListBottomSheetFooter(
                    state: state,
                    onSave: () => _saveBooktoListHandler(context),
                    onCancel: () => GoRouter.of(context).pop(),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  void _saveBooktoListHandler(BuildContext context) {
    final bookDetails = context.read<BookDetailsCubit>().saveBookToListData();
    if (bookDetails == null) return;

    context.read<SavedListBottomSheetCubit>().saveBookToList(
          BookListData(
            bookId: bookDetails.bookId,
            coverImage: bookDetails.coverImage,
            title: bookDetails.title,
            author: bookDetails.author,
          ),
        );
  }

  void _handleStateChanges(
      BuildContext context, SavedListBottomSheetState state) {
    state.maybeWhen(
      saveSuccess: (message) => showSuccessIndicator(context, message),
      saveError: (error) => showErrorIndicator(context, error),
      orElse: () {},
    );
  }

  void showErrorIndicator(BuildContext context, String error) {
    GoRouter.of(context).pop();
    SnackBarMessages().showErrorSnackBar(
      context: context,
      message: error,
      behavior: SnackBarBehavior.floating,
    );
  }

  void showSuccessIndicator(BuildContext context, String message) {
    GoRouter.of(context).pop();
    SnackBarMessages().showSuccessSnackBar(
      context: context,
      message: message,
      behavior: SnackBarBehavior.floating,
    );
  }

  BoxDecoration _bsDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20.r),
        topRight: Radius.circular(20.r),
      ),
    );
  }
}
