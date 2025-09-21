import 'package:library_app/core/helpers/api/api_result.dart';
import 'package:library_app/core/helpers/pagination_request.dart';

abstract class IHomeRepository {
  Future<ApiResult> getHomeData();

  Future<ApiResult> getBooksByCategory(
    int categoryId,
    PaginationRequest paginationInfo,
  );

  Future<ApiResult> getNewestBooks(
    PaginationRequest paginationInfo,
  );
}
