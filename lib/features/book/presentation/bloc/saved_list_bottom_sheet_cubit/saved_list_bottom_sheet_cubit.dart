import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/features/book/data/models/book_data_hive_model.dart';
import 'package:library_app/features/book/domain/abstracts/book_repository.dart';
import 'package:library_app/features/book/presentation/bloc/saved_list_bottom_sheet_cubit/saved_list_bottom_sheet_state.dart';
import 'package:library_app/features/book/presentation/models/book_list.dart';
import 'package:library_app/features/book/presentation/models/book_list_data.dart';
import 'package:library_app/generated/locale_keys.g.dart';

class SavedListBottomSheetCubit extends Cubit<SavedListBottomSheetState> {
  final IBookRepository _repo;
  SavedListBottomSheetCubit(this._repo)
      : super(const SavedListBottomSheetState.initial());

  /// Load Book Lists from Hive
  Future<void> loadLists() async => await _mockDataMode(0);

  Future<void> loadSavedists() async => _repoDataMode();

  Future<void> _mockDataMode(int mode) async {
    try {
      emit(const SavedListBottomSheetState.loading());
      // mock data
      await Future.delayed(const Duration(milliseconds: 500));
      final lists = mode == 0
          ? <BookListCardModel>[]
          : <BookListCardModel>[
              BookListCardModel(
                id: 1,
                name: 'قائمة القراءة',
                coverImage: 'https://example.com/book1.jpg',
                lastModified: DateTime.now(),
              ),
              BookListCardModel(
                id: 2,
                name: 'الكتب المفضلة',
                coverImage: 'https://example.com/book2.jpg',
                lastModified: DateTime.now().subtract(const Duration(days: 2)),
              ),
              BookListCardModel(
                id: 3,
                name: 'للقراءة لاحقاً',
                coverImage: 'https://example.com/book3.jpg',
                lastModified: DateTime.now().subtract(const Duration(days: 5)),
              ),
              BookListCardModel(
                id: 4,
                name: 'قائمة الكتب الرومانسية',
                coverImage: 'https://example.com/book1.jpg',
                lastModified: DateTime.now().subtract(const Duration(days: 15)),
              ),
              BookListCardModel(
                id: 5,
                name: 'قائمة كتب العلوم',
                coverImage: 'https://example.com/book2.jpg',
                lastModified: DateTime.now().subtract(const Duration(days: 8)),
              ),
              BookListCardModel(
                id: 6,
                name: 'قائمة كتب التاريخ',
                coverImage: 'https://example.com/book3.jpg',
                lastModified: DateTime.now().subtract(const Duration(days: 30)),
              ),
              BookListCardModel(
                id: 7,
                name: 'قائمة كتب البرمجة',
                coverImage: 'https://example.com/book1.jpg',
                lastModified: DateTime.now().subtract(const Duration(days: 12)),
              ),
              BookListCardModel(
                id: 8,
                name: 'قائمة كتب التعليمية',
                coverImage: 'https://example.com/book2.jpg',
                lastModified: DateTime.now().subtract(const Duration(days: 25)),
              ),
              BookListCardModel(
                id: 9,
                name: 'قائمة كتب الخيال العلمي',
                coverImage: 'https://example.com/book3.jpg',
                lastModified: DateTime.now().subtract(const Duration(days: 45)),
              ),
            ]
        ..sort((a, b) => b.lastModified.compareTo(a.lastModified));

      if (lists.isEmpty) {
        emit(const SavedListBottomSheetState.empty());
      } else {
        emit(SavedListBottomSheetState.loaded(
          bookLists: lists,
          selectedIndex: 0, // نختار القائمة الأولى تلقائياً
        ));
      }
    } catch (e) {
      emit(SavedListBottomSheetState.saveError(
        error: 'فشل في تحميل القوائم: ${e.toString()}',
      ));
    }
  }

  Future<void> _repoDataMode() async {
    final result = await _repo.getBookLists();

    if (!result.isSuccess) {
      String errMessage = _errMessage(result.errors!);
      emit(SavedListBottomSheetState.saveError(error: errMessage));
      return;
    }

    final lists = result.data!;
    if (lists.isEmpty) {
      emit(const SavedListBottomSheetState.empty());
      return;
    }

    // sort base on last modified date DESC
    lists.sort((a, b) => b.lastModified.compareTo(a.lastModified));

    final List<BookListCardModel> bookLists = lists.map((li) {
      // sort base on adding date DESC
      final sortedBooks = (li.books ?? [])
        ..sort((a, b) => b.addedAt.compareTo(a.addedAt));

      //Newest book cover image (if exists)
      final coverImage =
          sortedBooks.isNotEmpty ? sortedBooks.first.coverImage : null;

      return BookListCardModel(
        id: li.id,
        name: li.name,
        lastModified: li.lastModified,
        coverImage: coverImage,
      );
    }).toList();

    emit(SavedListBottomSheetState.loaded(
      bookLists: bookLists,
      selectedIndex: 0,
    ));
  }

  String _errMessage(List<String> errors) {
    return errors.length > 1 ? errors.join(",") : errors.first;
  }

  /// chanage selected list
  void selectList(int index) {
    final currentState = state;

    if (currentState is! Loaded) return;

    emit(currentState.copyWith(selectedIndex: index));
  }

  Future<void> createNewList(String listName) async {
    final result = await _repo.createList(listName: listName);
    if (!result.isSuccess) {
      String errMessage = _errMessage(result.errors!);
      emit(SavedListBottomSheetState.saveError(error: errMessage));
      return;
    }

    await loadSavedists();
  }

  Future<void> addBookToNewList(
    String listName,
    BookListData bookData,
  ) async {
    emit(const SavedListBottomSheetState.saving());

    final hiveDataModel = BookDataHiveModel(
      bookId: bookData.bookId,
      title: bookData.title,
      author: bookData.author,
      coverImage: bookData.coverImage,
    );

    final addingResult = await _repo.addBookToNewList(
      listName: listName,
      bookData: hiveDataModel,
    );
    if (addingResult.isSuccess) {
      String successMessage = LocaleKeys.successfully_operation.tr();

      emit(SavedListBottomSheetState.saveSuccess(message: successMessage));
      return;
    }
    String errMessage = _errMessage(addingResult.errors!);

    emit(SavedListBottomSheetState.saveError(
      error: LocaleKeys.operation_failed.tr(namedArgs: {"message": errMessage}),
    ));
  }

  Future<void> saveBookToList(BookListData bookData) async {
    final currentState = state;
    if (currentState is! Loaded) return;

    emit(const SavedListBottomSheetState.saving());

    final selectedList = currentState.bookLists[currentState.selectedIndex];
    final hiveDataModel = BookDataHiveModel(
      bookId: bookData.bookId,
      title: bookData.title,
      author: bookData.author,
      coverImage: bookData.coverImage,
    );
    final savingResult = await _repo.addBookToList(
      listId: selectedList.id,
      bookData: hiveDataModel,
    );
    if (savingResult.isSuccess) {
      emit(
        SavedListBottomSheetState.saveSuccess(
          message: LocaleKeys.successfully_operation.tr(),
        ),
      );

      return;
    }
    String errMessage = _errMessage(savingResult.errors!);
    emit(SavedListBottomSheetState.saveError(
      error: LocaleKeys.operation_failed.tr(namedArgs: {"message": errMessage}),
    ));
  }
}
