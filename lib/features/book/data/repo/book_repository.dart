import 'package:library_app/core/helpers/api/api_helper.dart';
import 'package:library_app/core/helpers/api/api_response.dart';
import 'package:library_app/core/helpers/api/api_result.dart';
import 'package:library_app/features/book/data/models/book_details.dart';
import 'package:library_app/features/book/data/services/book_service.dart';
import 'package:library_app/features/book/domain/abstracts/book_repository.dart';

class BookRepository implements IBookRepository {
  final BookService _service;

  BookRepository(this._service);
  @override
  Future<ApiResult> getBookDetails(
    int bookId,
  ) async {
    return await ApiHelper.executeApiCall<ApiResponse<BookDetailsModel>>(
      () => _service.getBookDetails(bookId),
    );
  }
}
