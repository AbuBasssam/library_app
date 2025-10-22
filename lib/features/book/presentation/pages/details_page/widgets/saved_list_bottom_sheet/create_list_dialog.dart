import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:library_app/core/helpers/snack_bar_messages.dart';
import 'package:library_app/core/widgets/cancel_button.dart';
import 'package:library_app/core/widgets/save_button.dart';
import 'package:library_app/features/book/presentation/bloc/book_details_cubit/book_details_cubit.dart';
import 'package:library_app/features/book/presentation/bloc/saved_list_bottom_sheet_cubit/saved_list_bottom_sheet_cubit.dart';
import 'package:library_app/features/book/presentation/bloc/saved_list_bottom_sheet_cubit/saved_list_bottom_sheet_state.dart';
import 'package:library_app/generated/locale_keys.g.dart';

class CreateListDialog extends StatefulWidget {
  final SavedListBottomSheetCubit bsCubit;
  final BookDetailsCubit bdCubit;

  const CreateListDialog({
    super.key,
    required this.bsCubit,
    required this.bdCubit,
  });

  @override
  State<CreateListDialog> createState() => _CreateListDialogState();
}

class _CreateListDialogState extends State<CreateListDialog> {
  late TextEditingController _controller;
  late ValueNotifier<bool> _isValidNotifier;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _isValidNotifier = ValueNotifier<bool>(false);
    _controller.addListener(_onTextChanged);
  }

  void _onTextChanged() {
    _isValidNotifier.value = _controller.text.trim().isNotEmpty;
  }

  @override
  void dispose() {
    _controller.dispose();
    _isValidNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(LocaleKeys.create_new_list.tr()),
      content: TextField(
        controller: _controller,
        autofocus: true,
        decoration: InputDecoration(
          hintText: LocaleKeys.create_new_list_description.tr(),
          border: const OutlineInputBorder(),
        ),
        onSubmitted: _onSubmitted,
      ),
      actions: [_btnCancel(context), _btnSave(context)],
    );
  }

  Widget _btnCancel(BuildContext context) {
    return CancelButton(onPressed: () => GoRouter.of(context).pop());
  }

  Widget _btnSave(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: _isValidNotifier,
      builder: (context, isValid, child) {
        return SaveButton(
          onPressed: isValid ? () => _createListHandler(context) : null,
        );
      },
    );
  }

  void _onSubmitted(String value) {
    if (value.trim().isNotEmpty) {
      _createListHandler(context);
    }
  }

  void _createListHandler(BuildContext context) {
    final listName = _controller.text.trim();
    final bookData = widget.bdCubit.saveBookToListData();

    // Case 1 : Create new list with initial book

    if (widget.bsCubit.state is Empty) {
      if (bookData != null) {
        widget.bsCubit.addBookToNewList(listName, bookData);
        GoRouter.of(context).pop();
      } else {
        _showErrorSnackBar(context);
      }
      // Case 2 : Create New list only
    } else if (widget.bsCubit.state is Loaded) {
      widget.bsCubit.createNewList(listName);
      GoRouter.of(context).pop();
    }
  }

  void _showErrorSnackBar(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      SnackBarMessages().showErrorSnackBar(
        context: context,
        message: LocaleKeys.operation_failed.tr(),
        behavior: SnackBarBehavior.floating,
      );
    });
  }
}
