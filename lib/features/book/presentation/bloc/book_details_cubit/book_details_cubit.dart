import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/core/helpers/app_strings.dart';
import 'package:library_app/core/helpers/local_operation_result.dart';
import 'package:library_app/features/book/data/models/book_details.dart';
import 'package:library_app/features/book/domain/abstracts/book_repository.dart';
import 'package:library_app/features/book/domain/entities/book_entity.dart';
import 'package:library_app/features/book/domain/entities/book_recommendations.dart';
import 'package:library_app/features/book/domain/abstracts/book_status.dart';
import 'package:library_app/features/book/domain/entities/borrowable_book_status.dart';
import 'package:library_app/features/book/domain/entities/borrowed_book_status.dart';
import 'package:library_app/features/book/domain/entities/en_book_state.dart';
import 'package:library_app/features/book/domain/entities/overdue_book_status.dart';
import 'package:library_app/features/book/domain/entities/reservable_book_status.dart';
import 'package:library_app/features/book/domain/entities/reserved_book_status.dart';
import 'package:library_app/features/book/domain/entities/unavailable_book_status.dart';
import 'package:library_app/features/book/domain/entities/user_book_preference.dart';
import 'package:library_app/features/book/presentation/bloc/book_details_cubit/book_details_state.dart';
import 'package:library_app/features/book/presentation/mappers/book_details_mapper.dart';
import 'package:library_app/features/book/presentation/models/book_list_data.dart';

class BookDetailsCubit extends Cubit<BookDetailsState> {
  final IBookRepository _repo;

  BookDetailsCubit(this._repo) : super(const BookDetailsState.initial());

  Future<void> emitBookDetailsStates(int bookId) async {
    emit(const BookDetailsState.loading());
    await _localeVersion(bookId);
  }

  Future<void> _localeVersion(int bookId) async {
    final jsonString = await rootBundle.loadString(
      AppStrings.borrowedBookDetails,
    );
    final jsonMap = jsonDecode(jsonString);
    final responseData = jsonMap['data'];
    final bookModel = BookDetailsModel.fromJson(responseData);
    final bookDetails = bookModel.toEntity();
    final bookStauts = _mapToBookStauts(jsonMap['meta'], bookModel.bookState);

    LocalOperationResult isSavedResult = await _repo.isSavedBook(bookId);

    final userPreference = UserBookPreference(
      bookId: bookDetails.id!,
      userRating: bookModel.userRating,
      isSaved: isSavedResult.isSuccess,
    );
    List<BookEntity> similarBooks = bookModel.similarBooks
        .map(
          (e) => BookEntity(
            id: e.bookId,
            imageUrl: e.coverImageUrl,
            isNew: e.isNewBook,
            title: e.title,
            author: e.author,
            rating: e.averageRating,
          ),
        )
        .toList();
    List<BookEntity> relatedBooks = bookModel.relatedBooks
        // .where((rb) => rb.bookId != bookDetails.id)
        .map(
          (e) => BookEntity(
            id: e.bookId,
            imageUrl: e.coverImageUrl,
            isNew: e.isNewBook,
            title: e.title,
            publishYear: e.publicationYear,
            rating: e.averageRating,
          ),
        )
        .toList();
    final BookRecommendations recommendations = BookRecommendations(
      similarBooks: similarBooks,
      relatedBooks: relatedBooks,
    );

    emit(
      BookDetailsState.success(
          bookDetails: bookDetails,
          bookStatus: bookStauts,
          userPreference: userPreference,
          recommendations: recommendations),
    );
  }

  /*Future<void> _remoteVersion(int bookId) async {
    final response = await _repo.getBookDetails(bookId);

    response.when(
      success: (response) async {
        final apiResponse = response as ApiResponse<BookDetailsModel>;
        final bookModel = response.data;
        final bookDetails = bookModel.toEntity();
        final meta = (apiResponse.meta as Map<String, dynamic>);
        final bookStauts = _mapToBookStauts(meta, apiResponse.data.bookState);

        LocalOperationResult isSavedResult = await _repo.isSavedBook(bookId);
        bool isSaved = isSavedResult.isSuccess;

        final userPreference = UserBookPreference(
          bookId: bookModel.bookId,
          userRating: bookModel.userRating,
          isSaved: isSaved,
        );
        List<BookEntity> similarBooks = bookModel.similarBooks
            .map(
              (e) => BookEntity(
                id: e.bookId,
                imageUrl: e.coverImageUrl,
                isNew: e.isNewBook,
                title: e.title,
                author: e.author,
                rating: e.averageRating,
              ),
            )
            .toList();
        List<BookEntity> relatedBooks = bookModel.relatedBooks
            // .where((rb) => rb.bookId != bookDetails.id)
            .map(
              (e) => BookEntity(
                id: e.bookId,
                imageUrl: e.coverImageUrl,
                isNew: e.isNewBook,
                title: e.title,
                publishYear: e.publicationYear,
                rating: e.averageRating,
              ),
            )
            .toList();
        final BookRecommendations recommendations = BookRecommendations(
          similarBooks: similarBooks,
          relatedBooks: relatedBooks,
        );

        emit(
          BookDetailsState.success(
            bookDetails: bookDetails,
            bookStatus: bookStauts,
            userPreference: userPreference,
            recommendations: recommendations,
          ),
        );
      },
      failure: (error) {
        String errMessage = error.apiErrorModel.message;

        emit(BookDetailsState.failure(message: errMessage));
      },
    );
  }

  */
  BookListData? saveBookToListData() {
    if (state is! Success) return null;

    final data = (state as Success).bookDetails;
    return BookListData(
      bookId: data.id!,
      coverImage: data.imageUrl!,
      title: data.title!,
      author: data.author!,
    );
  }

  BookStatus _mapToBookStauts(
      Map<String, dynamic>? bookMeta, enBookState bookStatue) {
    return switch (bookStatue) {
      enBookState.borrowable => BorrowableBookStatus.fromJson(bookMeta!),
      enBookState.borrowed => BorrowedBookStatus.fromJson(bookMeta!),
      enBookState.reservable => ReservableBookStatus.fromJson(bookMeta!),
      enBookState.reserved => ReservedBookStatus.fromJson(bookMeta!),
      enBookState.overdue => OverdueBookStatus.fromJson(bookMeta!),
      enBookState.unavailable => UnavailableBookStatus(),
    };
  }
}
