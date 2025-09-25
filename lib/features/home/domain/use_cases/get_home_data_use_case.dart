import 'package:dartz/dartz.dart';
import 'package:library_app/core/helpers/api/api_error_handler.dart';
import 'package:library_app/core/helpers/api/api_response.dart';
import 'package:library_app/core/helpers/failure.dart';
import 'package:library_app/core/helpers/pagination/pagination_response.dart';
import 'package:library_app/core/helpers/use_cases/no_param_usecase.dart';
import 'package:library_app/features/book/domain/entities/book_entity.dart';
import 'package:library_app/features/home/data/models/home_data.dart';
import 'package:library_app/features/home/domain/abstracts/ihome_repository.dart';
import 'package:library_app/features/home/domain/entities/book_category.dart';
import 'package:library_app/features/home/domain/entities/home_data_entity.dart';

class GetHomeDataUseCase implements UseCase<HomeDataEntity> {
  final IHomeRepository _repo;
  GetHomeDataUseCase(this._repo);
  @override
  Future<Either<MyFailure, HomeDataEntity>> execute() async {
    final response = await _repo.getHomeData();
    return response.when(
      success: (response) {
        final apiResponse = response as ApiResponse<HomeData>;
        return Right(_handleSuccess(apiResponse));
      },
      failure: (error) => Left(_handleFailure(error)),
    );
  }

  HomeDataEntity _handleSuccess(ApiResponse<HomeData> response) {
    var data = response.data;
    List<BookCategory> categories = data.categories
        .map((c) => BookCategory(id: c.categoryId, name: c.name))
        .toList();
    List<BookEntity> firstCategoryBooks = [];
    List<BookEntity> popularBooks = [];
    List<BookEntity> newestBooks = [];

    //
    for (var book in data.books) {
      final entity = BookEntity(
        id: book.baseData.bookId,
        title: book.baseData.title,
        author: book.baseData.author,
        imageUrl: book.baseData.coverImageUrl,
        isNew: book.baseData.isNew,
      );

      if (book.isMostPopular) {
        popularBooks.add(entity);
      }
      if (book.baseData.isNew) {
        newestBooks.add(entity);
      }
      if (book.isFirstCategory) {
        firstCategoryBooks.add(entity);
      }
    }
    Map<String, dynamic> meta = response.meta as Map<String, dynamic>;
    int totalNewBooks = (meta['totalNewBooks'] as num).toInt();
    int newBooksPageSize = (meta['newBooksPageSize'] as num).toInt();

    int newBooksPageCount = (totalNewBooks / newBooksPageSize).ceil();
    PaginationResult<BookEntity> newestBooksPage = PaginationResult<BookEntity>(
      totalCount: totalNewBooks,
      page: 1,
      pageSize: newestBooks.length,
      totalPages: newBooksPageCount,
      items: newestBooks,
    );

    int totalFirstCategoryBooks =
        (meta['totalFirstCategoryBooks'] as num).toInt();
    int firstCategoryPageSize = (meta['firstCategoryPageSize'] as num).toInt();

    int firstCategoryPageCount =
        (totalFirstCategoryBooks / firstCategoryPageSize).ceil();

    PaginationResult<BookEntity> firstCategoryBooksPage =
        PaginationResult<BookEntity>(
      totalCount: totalFirstCategoryBooks,
      page: 1,
      pageSize: firstCategoryBooks.length,
      totalPages: firstCategoryPageCount,
      items: firstCategoryBooks,
    );

    return HomeDataEntity(
      notificationCount: data.notificationCount,
      categories: categories,
      categoryBooksSection: firstCategoryBooksPage,
      mostPopularBooksSection: popularBooks,
      newestBooksSection: newestBooksPage,
    );
  }

  MyFailure _handleFailure(ErrorHandler error) {
    return HomeFailure(message: error.apiErrorModel.message);
  }
}
