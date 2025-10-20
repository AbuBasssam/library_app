import 'package:library_app/core/helpers/local_operation_result.dart';
import 'package:library_app/core/hive_box_manager.dart';
import 'package:library_app/features/book/data/models/book_data_hive_model.dart';
import 'package:library_app/features/book/data/models/book_list_hive_model.dart';

class BookListRepository {
  static const String _bookListsBoxName = 'book_lists';

  final HiveBoxManager _hiveBoxManager;

  BookListRepository(this._hiveBoxManager);

  Future<LocalOperationResult<List<BookListHiveModel>>> getBookLists() async {
    try {
      final box = await _hiveBoxManager.openBox<BookListHiveModel>(
        _bookListsBoxName,
      );
      final lists = box.values.toList();

      await _hiveBoxManager.releaseBox(_bookListsBoxName);

      return LocalOperationResult.success(lists);
    } catch (e) {
      return LocalOperationResult.failureWithError(e.toString());
    }
  }

  Future<LocalOperationResult<bool>> createList({
    required String listName,
  }) async {
    try {
      final box = await _hiveBoxManager.openBox<BookListHiveModel>(
        _bookListsBoxName,
      );
      final id = box.length + 1;

      final newList = BookListHiveModel(
        id: id,
        name: listName,
        coverImage: null,
        lastModified: DateTime.now(),
      );

      await box.put(newList.id, newList);
      await _hiveBoxManager.releaseBox(_bookListsBoxName);

      return LocalOperationResult.success(true);
    } on Exception catch (ex) {
      return LocalOperationResult.failureWithError(ex.toString());
    }
  }

  Future<LocalOperationResult<bool>> addBookToList({
    required int listId,
    required BookDataHiveModel bookData,
  }) async {
    try {
      final box = await _hiveBoxManager.openBox<BookListHiveModel>(
        _bookListsBoxName,
      );

      final selectedList = box.get(listId);

      if (selectedList == null) {
        await _hiveBoxManager.releaseBox(_bookListsBoxName);

        return LocalOperationResult.failureWithError('List not found');
      }

      final bookExists = selectedList.books?.any(
            (book) => book.bookId == bookData.bookId,
          ) ??
          false;

      if (bookExists) {
        await _hiveBoxManager.releaseBox(_bookListsBoxName);

        return LocalOperationResult.failureWithError(
          'Book already exists in ${selectedList.name}',
        );
      }
      final updatedList = selectedList.copyWith(
        books: [...?selectedList.books, bookData],
        coverImage: selectedList.coverImage ??
            bookData.coverImage, // update cover with last added book
        lastModified: DateTime.now(),
      );

      await box.put(listId, updatedList);
      await _hiveBoxManager.releaseBox(_bookListsBoxName);

      return LocalOperationResult.success(true);
    } on Exception catch (ex) {
      return LocalOperationResult.failureWithError(ex.toString());
    }
  }

  Future<LocalOperationResult<bool>> addBookToNewList({
    required String listName,
    required BookDataHiveModel bookData,
  }) async {
    try {
      final box =
          await _hiveBoxManager.openBox<BookListHiveModel>(_bookListsBoxName);

      final id = box.length + 1;

      final newList = BookListHiveModel(
        id: id,
        name: listName,
        coverImage: bookData.coverImage,
        books: [bookData],
        lastModified: DateTime.now(),
      );

      await box.put(id, newList);

      await _hiveBoxManager.releaseBox(_bookListsBoxName);

      return LocalOperationResult.success(true);
    } catch (e) {
      return LocalOperationResult.failureWithError(e.toString());
    }
  }

  Future<LocalOperationResult<bool>> deleteList(int listId) async {
    try {
      final box =
          await _hiveBoxManager.openBox<BookListHiveModel>(_bookListsBoxName);
      await box.delete(listId);
      await _hiveBoxManager.releaseBox(_bookListsBoxName);
      return LocalOperationResult.success(true);
    } catch (e) {
      return LocalOperationResult.failureWithError(e.toString());
    }
  }

  Future<LocalOperationResult<bool>> removeBookFromList({
    required int listId,
    required int bookId,
  }) async {
    try {
      final box =
          await _hiveBoxManager.openBox<BookListHiveModel>(_bookListsBoxName);
      final list = box.get(listId);
      if (list == null) {
        await _hiveBoxManager.releaseBox(_bookListsBoxName);
        return LocalOperationResult.failureWithError('List not found');
      }

      final updatedBooks =
          list.books?.where((b) => b.bookId != bookId).toList();

      await box.put(
        listId,
        list.copyWith(
          books: updatedBooks,
          lastModified: DateTime.now(),
        ),
      );
      await _hiveBoxManager.releaseBox(_bookListsBoxName);
      return LocalOperationResult.success(true);
    } catch (e) {
      return LocalOperationResult.failureWithError(e.toString());
    }
  }

  /// Check if book is saved in any list
  Future<LocalOperationResult<bool>> isSavedBook(int bookId) async {
    try {
      final box =
          await _hiveBoxManager.openBox<BookListHiveModel>(_bookListsBoxName);
      final exists = box.values.any(
        (list) => list.books?.any((b) => b.bookId == bookId) ?? false,
      );
      await _hiveBoxManager.releaseBox(_bookListsBoxName);
      return LocalOperationResult.success(exists);
    } catch (e) {
      return LocalOperationResult.failureWithError(e.toString());
    }
  }

  /*int _generateListId() {
    final currentLists = getBookLists();
    return currentLists.isEmpty ? 1 : currentLists.last.id + 1;
  }*/
}
