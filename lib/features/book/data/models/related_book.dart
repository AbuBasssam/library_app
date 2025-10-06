import 'package:json_annotation/json_annotation.dart';

part 'related_book.g.dart';

@JsonSerializable()
class RelatedBook {
  final int bookId;
  final String title;
  final String publicationYear;
  final double averageRating;
  final String coverImageUrl;
  final bool isNewBook;

  const RelatedBook({
    required this.bookId,
    required this.title,
    required this.publicationYear,
    required this.averageRating,
    required this.coverImageUrl,
    required this.isNewBook,
  });

  factory RelatedBook.fromJson(Map<String, dynamic> json) =>
      _$RelatedBookFromJson(json);

  Map<String, dynamic> toJson() => _$RelatedBookToJson(this);
}
