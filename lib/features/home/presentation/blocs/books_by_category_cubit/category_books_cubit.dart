import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/core/helpers/api/api_response.dart';
import 'package:library_app/core/helpers/pagination/pagination_request.dart';
import 'package:library_app/core/helpers/pagination/pagination_response.dart';
import 'package:library_app/features/book/domain/entities/book_entity.dart';
import 'package:library_app/features/home/data/models/base_book_data.dart';
import 'package:library_app/features/home/domain/abstracts/ihome_repository.dart';
import 'category_books_state.dart';

class CategoryBooksCubit extends Cubit<CategoryBooksState> {
  final IHomeRepository _repo;
  PaginationResult<BookEntity> booksPage;
  late int _currentCategoryId;
  late bool _hasNext;
  static const int _pageSize = 10;
  late Set<BookEntity> books;

  CategoryBooksCubit(this._repo, this.booksPage)
      : super(const CategoryBooksState.initial()) {
    _currentCategoryId = 1;
    _hasNext = booksPage.hasNext;
    books = Set<BookEntity>.from(booksPage.items);
  }

  Future<void> changeCategory(int categoryId) async {
    emit(const CategoryBooksState.loading());

    final response = await _repo.getBooksByCategory(
      categoryId,
      PaginationRequest(pageSize: _pageSize),
    );

    response.when(success: (response) {
      final apiResponse =
          response as ApiResponse<PaginationResult<BaseBookData>>;
      _currentCategoryId = categoryId;
      _hasNext = response.data.hasNext;

      books = _bookEntityMapper(apiResponse.data.items).toSet();

      emit(CategoryBooksState.success(books: books.toList()));
    }, failure: (error) {
      String errMessage = error.apiErrorModel.message;

      emit(CategoryBooksState.failure(message: errMessage));
    });
  }

  Future<void> moveToNextPage() async {
    if (!_hasNext) {
      return;
    }

    final response = await _repo.getBooksByCategory(
      _currentCategoryId,
      PaginationRequest(
        pageNumber: booksPage.page + 1,
        pageSize: _pageSize,
      ),
    );

    response.when(success: (response) {
      //_updatePaginationInfo();
      final apiResponse =
          response as ApiResponse<PaginationResult<BaseBookData>>;
      books.addAll(_bookEntityMapper(apiResponse.data.items));
      _hasNext = apiResponse.data.hasNext;

      emit(CategoryBooksState.success(books: books.toList()));
    }, failure: (error) {
      String errMessage = error.apiErrorModel.message;

      emit(CategoryBooksState.failure(message: errMessage));
    });
  }

  @override
  Future<void> close() {
    //books.clear();
    return super.close();
  }

  List<BookEntity> _bookEntityMapper(List<BaseBookData> data) {
    return data
        .map(
          (b) => BookEntity(
              id: b.bookId,
              author: b.author,
              title: b.title,
              imageUrl: b.coverImageUrl,
              isNew: b.isNew),
        )
        .toList();
  }
}
