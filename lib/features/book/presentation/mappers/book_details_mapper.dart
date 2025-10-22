import 'package:library_app/features/book/data/models/book_details.dart';
import 'package:library_app/features/book/domain/entities/book_entity.dart';

extension BookDetailsMapper on BookDetailsModel {
  BookEntity toEntity() {
    return BookEntity(
      id: bookId,
      title: title,
      author: author,
      imageUrl: coverImageUrl,
      isNew: isNewBook,
      description: description,
      publishYear: publicationYear,
      pagesCount: pages,
      isbn: isbn,
      publisher: publisher,
      language: language,
      category: category,
      rating: averageRating,
      readersCount: totalReaders,
    );
  }
}
