import 'package:flutter_bloc/flutter_bloc.dart';
import 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit() : super(const NewestBooksState.initial());

  Future<void> getNewestBooks() async {
    /*try {
      emit(const NewestBooksState.loading());
      // TODO: Call UseCase / Repository
      await Future.delayed(const Duration(seconds: 1)); // mock
      emit(NewestBooksState.success(books: ["Newest Book 1", "Newest Book 2"]));
    } catch (e) {
      emit(NewestBooksState.failure(message: e.toString()));
    }*/
  }
}
