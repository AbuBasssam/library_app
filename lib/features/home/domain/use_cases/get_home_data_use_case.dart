import 'package:dartz/dartz.dart';
import 'package:library_app/core/helpers/api/api_error_handler.dart';
import 'package:library_app/core/helpers/api/api_response.dart';
import 'package:library_app/core/helpers/failure.dart';
import 'package:library_app/core/helpers/pagination_response.dart';
import 'package:library_app/core/helpers/use_cases/no_param_usecase.dart';
import 'package:library_app/features/book/domain/entities/book_entity.dart';
import 'package:library_app/features/home/data/models/home_data.dart';
import 'package:library_app/features/home/data/repos/home_repository.dart';
import 'package:library_app/features/home/domain/entities/home_data_entity.dart';

class GetHomeDataUseCase implements UseCase<HomeDataEntity> {
  final HomeRepository _repo;
  GetHomeDataUseCase(this._repo);
  @override
  Future<Either<MyFailure, HomeDataEntity>> execute() async {
    final response = await _repo.getHomeData();
    return response.when(
      success: (response) {
        final apiResponse = response as ApiResponse<HomeData>;
        return Right(_handleSuccess(apiResponse.data));
      },
      failure: (error) => Left(_handleFailure(error)),
    );
  }

  HomeDataEntity _handleSuccess(HomeData data) {
    List<BookEntity> firstCategoryBooks = [];

    List<BookEntity> popularBooks = [];
    List<BookEntity> newestBooks = [];
    //
    for (var book in data.books) {
      final entity = BookEntity(
        id: book.bookId,
        title: book.title,
        author: book.author,
        imageUrl: book.coverImageUrl,
        isNew: book.isNew,
      );

      if (book.isMostPopular) {
        popularBooks.add(entity);
      }
      if (book.isNew) {
        newestBooks.add(entity);
      }
      if (book.isFirstCategory) {
        firstCategoryBooks.add(entity);
      }
    }

    int newBooksPageCount = (data.totalNewBooks / data.newBooksPageSize).ceil();
    PaginationResult<BookEntity> newestBooksPage = PaginationResult<BookEntity>(
      totalCount: data.totalNewBooks,
      page: 1,
      pageSize: newestBooks.length,
      totalPages: newBooksPageCount,
      items: newestBooks,
    );

    int firstCategoryPageCount =
        (data.totalFirstCategoryBooks / data.firstCategoryPageSize).ceil();

    PaginationResult<BookEntity> firstCategoryBooksPage =
        PaginationResult<BookEntity>(
      totalCount: data.totalFirstCategoryBooks,
      page: 1,
      pageSize: firstCategoryBooks.length,
      totalPages: firstCategoryPageCount,
      items: firstCategoryBooks,
    );

    return HomeDataEntity(
      newestBooksSection: newestBooksPage,
      categoryBooksSection: firstCategoryBooksPage,
      mostPopularBooksSection: popularBooks,
    );
  }

  MyFailure _handleFailure(ErrorHandler error) {
    return HomeFailure(message: error.apiErrorModel.message);
  }
}
