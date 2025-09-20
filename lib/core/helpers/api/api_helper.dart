import 'api_result.dart';
import 'api_error_handler.dart';

class ApiHelper {
  // Helper method to handle repetitive try-catch logic
  static Future<ApiResult> executeApiCall<T>(
      Future<T> Function() apiCall) async {
    try {
      final response = await apiCall();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
