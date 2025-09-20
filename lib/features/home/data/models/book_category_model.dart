import 'package:library_app/features/home/domain/entities/book_category.dart';
import 'package:json_annotation/json_annotation.dart';
part 'book_category_model.g.dart';

@JsonSerializable()
class BookCategoryModel extends BookCategory {
  BookCategoryModel({
    required super.id,
    required super.name,
  });
  factory BookCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$BookCategoryModelFromJson(json);
}
