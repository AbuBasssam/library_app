import 'package:json_annotation/json_annotation.dart';

part 'home_book.g.dart';

@JsonSerializable()
class HomeBook {
  final int bookId;
  final String title;
  final String author;
  final String coverImageUrl;
  final bool isNew;
  final bool isFirstCategory;
  final bool isMostPopular;

  HomeBook({
    required this.bookId,
    required this.title,
    required this.author,
    required this.coverImageUrl,
    required this.isNew,
    required this.isFirstCategory,
    required this.isMostPopular,
  });
  factory HomeBook.fromJson(Map<String, dynamic> json) =>
      _$HomeBookFromJson(json);
  Map<String, dynamic> toJson() => _$HomeBookToJson(this);
}
