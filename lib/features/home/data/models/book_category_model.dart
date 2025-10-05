import 'package:json_annotation/json_annotation.dart';
part 'book_category_model.g.dart';

@JsonSerializable()
class BookCategoryModel {
  final int categoryId;
  final String name;
  BookCategoryModel({
    required this.categoryId,
    required this.name,
  });
  factory BookCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$BookCategoryModelFromJson(json);
}
