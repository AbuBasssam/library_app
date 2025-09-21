import 'package:library_app/core/helpers/api/api_helper.dart';
import 'package:library_app/core/helpers/api/api_result.dart';
import 'package:library_app/core/helpers/pagination_request.dart';
import 'package:library_app/features/home/data/services/home_service.dart';
import 'package:library_app/features/home/domain/abstracts/ihome_repository.dart';

class HomeRepository implements IHomeRepository {
  final HomeService _service;

  HomeRepository(this._service);

  @override
  Future<ApiResult> getBooksByCategory(
      int categoryId, PaginationRequest paginationInfo) async {
    return await ApiHelper.executeApiCall(
      () => _service.getBooksByCategory(categoryId, paginationInfo),
    );
  }

  @override
  Future<ApiResult> getHomeData() async {
    return await ApiHelper.executeApiCall(() => _service.getHomeData());
  }

  @override
  Future<ApiResult> getNewestBooks(PaginationRequest pagintionInfo) async {
    return await ApiHelper.executeApiCall(
      () => _service.getNewestBooks(pagintionInfo),
    );
  }
}
