import 'package:library_app/core/helpers/api/api_helper.dart';
import 'package:library_app/core/helpers/api/api_response.dart';
import 'package:library_app/core/helpers/api/api_result.dart';
import 'package:library_app/core/helpers/local_operation_result.dart';
import 'package:library_app/features/book/data/models/book_data_hive_model.dart';
import 'package:library_app/features/book/data/models/book_details.dart';
import 'package:library_app/features/book/data/models/book_list_hive_model.dart';
import 'package:library_app/features/book/data/repo/book_list_repository.dart';
import 'package:library_app/features/book/data/services/book_service.dart';
import 'package:library_app/features/book/domain/abstracts/book_repository.dart';

class BookRepository implements IBookRepository {
  final BookService _service;
  final BookListRepository _repo;

  BookRepository(this._service, this._repo);
  @override
  Future<ApiResult> getBookDetails(
    int bookId,
  ) async {
    return await ApiHelper.executeApiCall<ApiResponse<BookDetailsModel>>(
      () => _service.getBookDetails(bookId),
    );
  }

  @override
  Future<LocalOperationResult<List<BookListHiveModel>>> getBookLists() async {
    return await _repo.getBookLists();
  }

  @override
  Future<LocalOperationResult<bool>> createList({
    required String listName,
  }) async {
    return await _repo.createList(listName: listName);
  }

  @override
  Future<LocalOperationResult<bool>> addBookToNewList({
    required String listName,
    required BookDataHiveModel bookData,
  }) async {
    return await _repo.addBookToNewList(
      listName: listName,
      bookData: bookData,
    );
  }

  @override
  Future<LocalOperationResult<bool>> addBookToList({
    required int listId,
    required BookDataHiveModel bookData,
  }) {
    return _repo.addBookToList(listId: listId, bookData: bookData);
  }

  @override
  Future<LocalOperationResult<bool>> removeBookFromList({
    required int listId,
    required int bookId,
  }) {
    return _repo.removeBookFromList(listId: listId, bookId: bookId);
  }

  @override
  Future<LocalOperationResult<bool>> deleteList(int listId) {
    return _repo.deleteList(listId);
  }

  @override
  Future<LocalOperationResult<bool>> isSavedBook(int bookId) {
    return _repo.isSavedBook(bookId);
  }
}
