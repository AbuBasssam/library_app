import 'package:library_app/core/helpers/api/api_result.dart';

abstract class IBookRepository {
  Future<ApiResult> getBookDetails(int bookId);
}
