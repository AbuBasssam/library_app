import 'package:dio/dio.dart';
import 'package:library_app/core/helpers/response_code.dart';
import 'package:library_app/core/helpers/response_message.dart';
import 'api_error_model.dart';

enum DataSource {
  noContent,
  badRequest,
  forbidden,
  unAuthorised,
  notFound,
  internalServerError,
  connectTimeout,
  cancel,
  recieveTimeout,
  sendTimeout,
  cachError,
  noInternetConnection,
  // API_LOGIC_ERROR,
  apiLogicError
}

extension DataSourceExtension on DataSource {
  ApiErrorModel getFailure() {
    switch (this) {
      case DataSource.noContent:
        return const ApiErrorModel(
          statusCode: ResponseCode.noContent,
          message: ResponseMessage.noContent,
        );
      case DataSource.badRequest:
        return const ApiErrorModel(
          statusCode: ResponseCode.badRequest,
          message: ResponseMessage.badRequest,
        );
      case DataSource.forbidden:
        return const ApiErrorModel(
          statusCode: ResponseCode.forbidden,
          message: ResponseMessage.forbidden,
        );
      case DataSource.unAuthorised:
        return const ApiErrorModel(
          statusCode: ResponseCode.unAuthorised,
          message: ResponseMessage.unauthorized,
        );
      case DataSource.notFound:
        return const ApiErrorModel(
          statusCode: ResponseCode.notFound,
          message: ResponseMessage.notFound,
        );
      case DataSource.internalServerError:
        return const ApiErrorModel(
          statusCode: ResponseCode.internalServerError,
          message: ResponseMessage.internalServerError,
        );

      case DataSource.connectTimeout:
        return ApiErrorModel(
          statusCode: ResponseCode.connectTimeout,
          message: ResponseMessage.connectionTimeout,
        );
      case DataSource.cancel:
        return ApiErrorModel(
          statusCode: ResponseCode.cancel,
          message: ResponseMessage.cancel,
        );
      case DataSource.recieveTimeout:
        return ApiErrorModel(
          statusCode: ResponseCode.recieveTimeout,
          message: ResponseMessage.recieveTimeout,
        );
      case DataSource.sendTimeout:
        return ApiErrorModel(
          statusCode: ResponseCode.sendTimeout,
          message: ResponseMessage.sendTimeout,
        );
      case DataSource.cachError:
        return ApiErrorModel(
          statusCode: ResponseCode.cachError,
          message: ResponseMessage.cachError,
        );
      case DataSource.noInternetConnection:
        return ApiErrorModel(
          statusCode: ResponseCode.noInternetConnection,
          message: ResponseMessage.noInternetConnection,
        );
      case DataSource.apiLogicError:
        return ApiErrorModel(
            statusCode: ResponseCode.defalut,
            message: ResponseMessage.defalutLocalError);
    }
  }
}

class ErrorHandler implements Exception {
  late ApiErrorModel apiErrorModel;

  ErrorHandler.handle(dynamic error) {
    if (error is DioException) {
      // dio error so its an error from response of the API or from dio itself
      apiErrorModel = _handleError(error);
    } else {
      // default error
      apiErrorModel = DataSource.apiLogicError.getFailure();
    }
  }
}

ApiErrorModel _handleError(DioException error) {
  switch (error.type) {
    case DioExceptionType.connectionTimeout:
      return DataSource.connectTimeout.getFailure();

    case DioExceptionType.sendTimeout:
      return DataSource.sendTimeout.getFailure();

    case DioExceptionType.receiveTimeout:
      return DataSource.recieveTimeout.getFailure();

    case DioExceptionType.badResponse:
      if (error.response != null &&
          error.response?.statusCode != null &&
          error.response?.statusMessage != null) {
        return ApiErrorModel.fromJson(error.response!.data);
      } else {
        return DataSource.apiLogicError.getFailure();
      }

    case DioExceptionType.cancel:
      return DataSource.cancel.getFailure();

    case DioExceptionType.connectionError:
      return DataSource.noInternetConnection.getFailure();

    case DioExceptionType.badCertificate:
      return DataSource.apiLogicError.getFailure();

    case DioExceptionType.unknown:
      if (error.response != null &&
          error.response?.statusCode != null &&
          error.response?.statusMessage != null) {
        return ApiErrorModel.fromJson(error.response!.data);
      } else {
        return DataSource.apiLogicError.getFailure();
      }
  }
}

class ApiInternalStatus {
  static const int success = 0;
  static const int failure = 1;
}
