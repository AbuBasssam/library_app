import 'package:json_annotation/json_annotation.dart';

part 'base_book_data.g.dart';

@JsonSerializable()
class BaseBookData {
  final int bookId;
  final String title;
  final String author;
  final String coverImageUrl;

  @JsonKey(name: 'isNewBook')
  final bool isNew;
  BaseBookData({
    required this.bookId,
    required this.title,
    required this.author,
    required this.coverImageUrl,
    required this.isNew,
  });
  factory BaseBookData.fromJson(Map<String, dynamic> json) {
    return _$BaseBookDataFromJson(json);
  }
}
