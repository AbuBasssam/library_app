import 'package:hive/hive.dart';
import 'package:library_app/features/book/data/models/book_data_hive_model.dart';

part 'book_list_hive_model.g.dart';

@HiveType(typeId: 0)
class BookListHiveModel {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String? coverImage;
  @HiveField(3)
  final DateTime lastModified;
  @HiveField(4)
  List<BookDataHiveModel>? books;
  BookListHiveModel({
    required this.id,
    required this.name,
    required this.coverImage,
    required this.lastModified,
    this.books,
  });

  BookListHiveModel copyWith({
    int? id,
    String? name,
    String? coverImage,
    DateTime? lastModified,
    List<BookDataHiveModel>? books,
  }) {
    return BookListHiveModel(
      id: id ?? this.id,
      name: name ?? this.name,
      coverImage: coverImage ?? this.coverImage,
      lastModified: lastModified ?? this.lastModified,
      books: books ?? this.books,
    );
  }
}
