import 'package:json_annotation/json_annotation.dart';
import 'home_book.dart';
import 'book_category_model.dart';

part 'home_data.g.dart';

@JsonSerializable()
class HomeData {
  final int notificationCount;
  final List<BookCategoryModel> categories;
  final List<HomeBook> books;

  HomeData({
    required this.notificationCount,
    required this.categories,
    required this.books,
  });
  factory HomeData.fromJson(Map<String, dynamic> json) =>
      _$HomeDataFromJson(json);
  Map<String, dynamic> toJson() => _$HomeDataToJson(this);
}
