import 'package:dio/dio.dart';
import 'package:library_app/core/helpers/api/api_constants.dart';
import 'package:library_app/core/helpers/api/api_response.dart';
import 'package:library_app/features/book/data/models/book_details.dart';
import 'package:retrofit/retrofit.dart';

part 'book_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class BookService {
  factory BookService(Dio dio, {String baseUrl}) = _BookService;

  @GET(ApiConstants.bookDetailsEndpoint)
  Future<ApiResponse<BookDetailsModel>> getBookDetails(@Path("id") int bookId);
}
