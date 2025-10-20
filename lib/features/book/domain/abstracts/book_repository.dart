import 'package:library_app/core/helpers/api/api_result.dart';
import 'package:library_app/core/helpers/local_operation_result.dart';
import 'package:library_app/features/book/data/models/book_data_hive_model.dart';
import 'package:library_app/features/book/data/models/book_list_hive_model.dart';

abstract class IBookRepository {
  Future<ApiResult> getBookDetails(int bookId);
  Future<LocalOperationResult<List<BookListHiveModel>>> getBookLists();

  Future<LocalOperationResult<bool>> createList({
    required String listName,
  });

  Future<LocalOperationResult<bool>> addBookToNewList({
    required String listName,
    required BookDataHiveModel bookData,
  });

  Future<LocalOperationResult<bool>> addBookToList({
    required int listId,
    required BookDataHiveModel bookData,
  });

  Future<LocalOperationResult<bool>> removeBookFromList({
    required int listId,
    required int bookId,
  });

  Future<LocalOperationResult<bool>> deleteList(int listId);

  Future<LocalOperationResult<bool>> isSavedBook(int bookId);
}
