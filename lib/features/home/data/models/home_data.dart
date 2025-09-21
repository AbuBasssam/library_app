import 'package:json_annotation/json_annotation.dart';
import 'home_book.dart';
import 'book_category_model.dart';

part 'home_data.g.dart';

@JsonSerializable()
class HomeData {
  final int notificationCount;
  final List<BookCategoryModel> categories;
  final List<HomeBook> books;

  @JsonKey(name: 'meta:firstCategoryPageSize')
  final int firstCategoryPageSize;
  @JsonKey(name: 'meta:totalFirstCategoryBooks')
  final int totalFirstCategoryBooks;
  @JsonKey(name: 'meta:totalNewBooks')
  final int totalNewBooks;
  @JsonKey(name: 'meta:newBooksPageSize')
  final int newBooksPageSize;

  HomeData({
    required this.notificationCount,
    required this.categories,
    required this.books,
    required this.firstCategoryPageSize,
    required this.totalFirstCategoryBooks,
    required this.totalNewBooks,
    required this.newBooksPageSize,
  });
  factory HomeData.fromJson(Map<String, dynamic> json) =>
      _$HomeDataFromJson(json);
  Map<String, dynamic> toJson() => _$HomeDataToJson(this);
}
