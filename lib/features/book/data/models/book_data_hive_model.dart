import 'package:hive/hive.dart';
part 'book_data_hive_model.g.dart';

@HiveType(typeId: 1)
class BookDataHiveModel {
  @HiveField(0)
  final int bookId;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String author;
  @HiveField(3)
  final String coverImage;
  @HiveField(4)
  final DateTime addedAt = DateTime.now();

  BookDataHiveModel({
    required this.bookId,
    required this.title,
    required this.author,
    required this.coverImage,
  });
}
