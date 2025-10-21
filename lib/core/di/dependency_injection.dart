import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:library_app/core/hive_box_manager.dart';
import 'package:library_app/features/book/data/repo/book_list_repository.dart';
import 'package:library_app/features/book/data/repo/book_repository.dart';
import 'package:library_app/features/book/data/services/book_service.dart';
import 'package:library_app/features/book/domain/abstracts/book_repository.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:get_it/get_it.dart';
import 'package:library_app/features/home/data/repos/home_repository.dart';
import 'package:library_app/features/home/data/services/home_service.dart';
import 'package:library_app/features/home/domain/abstracts/ihome_repository.dart';
import 'package:library_app/features/home/domain/use_cases/get_home_data_use_case.dart';

final getIt = GetIt.instance;
Future<void> setupDependencies() async {
  await coreDependencies();
  homeDependencies();
  bookDependencies();
}

Future<void> coreDependencies() async {
  // Create Dio instance with factory method that sets up interceptors
  getIt.registerLazySingleton<Dio>(() => _createConfiguredDio());
  getIt.registerLazySingleton<HiveBoxManager>(() => HiveBoxManager());
}

// Private method to create and configure Dio with interceptors
Dio _createConfiguredDio() {
  final dio = Dio();

  // Basic Dio configuration
  dio.options.connectTimeout = const Duration(seconds: 30);
  dio.options.receiveTimeout = const Duration(seconds: 30);

  // SSL verification disable for testing
  (dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
    HttpClient client = HttpClient();
    client.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    return client;
  };
  dio.interceptors.add(
    PrettyDioLogger(
      requestBody: true,
      requestHeader: true,
      responseHeader: true,
    ),
  );

  return dio;
}

void homeDependencies() {
  final dio = getIt<Dio>(); // Retrieve the singleton instance
  //Home Core dependencies

  //Home Services
  getIt.registerLazySingleton<HomeService>(() => HomeService(dio));

  //Home repos
  getIt.registerLazySingleton<IHomeRepository>(
    () => HomeRepository(getIt<HomeService>()),
  );
  //Home Use Cases
  getIt.registerLazySingleton<GetHomeDataUseCase>(
      () => GetHomeDataUseCase(getIt<IHomeRepository>()));
}

void bookDependencies() {
  final dio = getIt<Dio>(); // Retrieve the singleton instance
  // Book Services
  getIt.registerLazySingleton<BookService>(() => BookService(dio));

  // Repositories
  getIt.registerLazySingleton<BookListRepository>(
    () => BookListRepository(getIt<HiveBoxManager>()),
  );

  getIt.registerLazySingleton<IBookRepository>(
    () => BookRepository(
      getIt<BookService>(),
      getIt<BookListRepository>(),
    ),
  );
  // Register book-related dependencies here
}


/*void _setupDioInterceptors() {
  final dio = getIt<Dio>();

  // Clear any existing interceptors
  dio.interceptors.clear();

  // Register and add AppIntercepters
  getIt.registerLazySingleton<AppIntercepters>(
    () => AppIntercepters(
      getIt<IAuthLocalDataSoure>(),
      getIt<IAuthService>(),
      getIt<ILangLocalDataSource>(),
      dio,
    ),
  );

  // Add the interceptor to Dio
  dio.interceptors.add(getIt<AppIntercepters>());

  // Add pretty logger for debugging (optional)
  dio.interceptors.add(
    PrettyDioLogger(
      requestBody: true,
      requestHeader: true,
      responseHeader: true,
    ),
  );
}*/