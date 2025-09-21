import 'package:flutter_bloc/flutter_bloc.dart';
import 'books_by_category_state.dart';

class BooksByCategoryCubit extends Cubit<BooksByCategoryState> {
  BooksByCategoryCubit() : super(const BooksByCategoryState.initial());

  Future<void> getBooksByCategory(String categoryId) async {
    try {
      emit(const BooksByCategoryState.loading());
      // TODO: Call UseCase / Repository
      await Future.delayed(const Duration(seconds: 1)); // mock
      emit(BooksByCategoryState.success(books: ["Book 1", "Book 2"]));
    } catch (e) {
      emit(BooksByCategoryState.failure(message: e.toString()));
    }
  }
}
