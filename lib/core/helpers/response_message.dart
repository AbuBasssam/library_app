import 'api/api_errors.dart';

class ResponseMessage {
  static const String noContent =
      ApiErrors.noContent; // success with no data (no content)

  static const String badRequest =
      ApiErrors.badRequestError; // failure, API rejected request

  static const String unauthorized =
      ApiErrors.unauthorizedError; // failure, user is not authorised

  static const String forbidden =
      ApiErrors.forbiddenError; //  failure, API rejected request

  static const String internalServerError =
      ApiErrors.internalServerError; // failure, crash in server side

  static const String notFound =
      ApiErrors.notFoundError; // failure, crash in server side

  // local status code
  static String connectionTimeout = ApiErrors.timeoutError;
  static String cancel = ApiErrors.defaultError;
  static String recieveTimeout = ApiErrors.timeoutError;
  static String sendTimeout = ApiErrors.timeoutError;
  static String cachError = ApiErrors.cacheError;
  static String noInternetConnection = ApiErrors.noInternetError;
  static String defalutLocalError = ApiErrors.defaultError;
}
