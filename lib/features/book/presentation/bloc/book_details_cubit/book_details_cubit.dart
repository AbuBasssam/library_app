import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/core/helpers/api/api_response.dart';
import 'package:library_app/features/book/data/models/book_details.dart';
import 'package:library_app/features/book/domain/abstracts/book_repository.dart';
import 'package:library_app/features/book/presentation/bloc/book_details_cubit/book_details_state.dart';

class BookDetailsCubit extends Cubit<BookDetailsState> {
  final IBookRepository _repo;

  BookDetailsCubit(this._repo) : super(const BookDetailsState.initial());

  Future<void> emitBookDetailsStates(int bookId) async {
    emit(const BookDetailsState.loading());

    final response = await _repo.getBookDetails(bookId);

    response.when(success: (response) {
      final apiResponse = response as ApiResponse<BookDetailsModel>;

      emit(BookDetailsState.success(data: apiResponse.data));
    }, failure: (error) {
      String errMessage = error.apiErrorModel.message;

      emit(BookDetailsState.failure(message: errMessage));
    });
  }
}
