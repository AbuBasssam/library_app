import 'package:json_annotation/json_annotation.dart';
import 'package:library_app/features/home/data/models/base_book_data.dart';

part 'home_book.g.dart';

@JsonSerializable()
class HomeBook {
  final BaseBookData baseData;
  final bool isFirstCategory;
  final bool isMostPopular;

  HomeBook({
    required this.baseData,
    required this.isFirstCategory,
    required this.isMostPopular,
  });
  factory HomeBook.fromJson(Map<String, dynamic> json) =>
      _$HomeBookFromJson(json);
  Map<String, dynamic> toJson() => _$HomeBookToJson(this);
}
