import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/core/helpers/api/api_response.dart';
import 'package:library_app/core/helpers/pagination/pagination_request.dart';
import 'package:library_app/core/helpers/pagination/pagination_response.dart';
import 'package:library_app/features/book/domain/entities/book_entity.dart';
import 'package:library_app/features/home/data/models/base_book_data.dart';
import 'package:library_app/features/home/domain/abstracts/ihome_repository.dart';
import 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  final IHomeRepository _repo;
  PaginationResult<BookEntity> booksPage;
  late bool _hasNext;
  static const int _pageSize = 10;
  late Set<BookEntity> newestBooks;

  NewestBooksCubit(this._repo, this.booksPage)
      : super(const NewestBooksState.initial()) {
    _hasNext = booksPage.hasNext;
    newestBooks = Set<BookEntity>.from(booksPage.items);
  }

  Future<void> fetchNextNewestBooksPage() async {
    if (!_hasNext) {
      return;
    }

    final response = await _repo.getNewestBooks(
      PaginationRequest(
        pageNumber: booksPage.page + 1,
        pageSize: _pageSize,
      ),
    );

    response.when(success: (response) {
      final apiResponse =
          response as ApiResponse<PaginationResult<BaseBookData>>;
      newestBooks.addAll(_bookEntityMapper(apiResponse.data.items).toSet());
      _hasNext = apiResponse.data.hasNext;

      emit(NewestBooksState.success(books: newestBooks.toList()));
    }, failure: (error) {
      String errMessage = error.apiErrorModel.message;

      emit(NewestBooksState.failure(message: errMessage));
    });
  }

  List<BookEntity> _bookEntityMapper(List<BaseBookData> data) {
    return data
        .map(
          (b) => BookEntity(
            id: b.bookId,
            author: b.author,
            title: b.title,
            imageUrl: b.coverImageUrl,
            isNew: b.isNew,
          ),
        )
        .toList();
  }
}
