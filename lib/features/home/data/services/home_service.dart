import 'package:library_app/core/helpers/api/api_constants.dart';
import 'package:library_app/core/helpers/api/api_response.dart';
import 'package:library_app/core/helpers/pagination/pagination_request.dart';
import 'package:library_app/core/helpers/pagination/pagination_response.dart';
import 'package:library_app/features/home/data/models/base_book_data.dart';
import 'package:dio/dio.dart';
import 'package:library_app/features/home/data/models/home_data.dart';
import 'package:retrofit/retrofit.dart';

part 'home_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class HomeService {
  factory HomeService(Dio dio, {String baseUrl}) = _HomeService;

  @GET(ApiConstants.homeEndpoint)
  Future<ApiResponse<HomeData>> getHomeData();

  @GET(ApiConstants.booksByCategoryEndpoint)
  Future<ApiResponse<PaginationResult<BaseBookData>>> getBooksByCategory(
    @Path("id") int categoryId,
    @Queries() PaginationRequest request,
  );

  @GET(ApiConstants.newestBooksEndpoint)
  Future<ApiResponse<PaginationResult<BaseBookData>>> getNewestBooks(
    @Queries() PaginationRequest request,
  );
}
