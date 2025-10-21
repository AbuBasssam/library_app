import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'book_list_data.g.dart';

@JsonSerializable()
class BookListData extends Equatable {
  final int bookId;
  final String coverImage;
  final String title;
  final String author;

  const BookListData({
    required this.bookId,
    required this.coverImage,
    required this.title,
    required this.author,
  });
  factory BookListData.fromJson(Map<String, dynamic> json) =>
      _$BookListDataFromJson(json);

  Map<String, dynamic> toJson() => _$BookListDataToJson(this);

  @override
  List<Object?> get props => [bookId, coverImage, title, author];
}
