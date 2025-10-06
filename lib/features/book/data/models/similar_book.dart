import 'package:json_annotation/json_annotation.dart';

part 'similar_book.g.dart';

@JsonSerializable()
class SimilarBook {
  final int bookId;
  final String title;
  final String author;
  final double averageRating;
  final String coverImageUrl;
  final bool isNewBook;

  const SimilarBook({
    required this.bookId,
    required this.title,
    required this.author,
    required this.averageRating,
    required this.coverImageUrl,
    required this.isNewBook,
  });

  factory SimilarBook.fromJson(Map<String, dynamic> json) =>
      _$SimilarBookFromJson(json);

  Map<String, dynamic> toJson() => _$SimilarBookToJson(this);
}
