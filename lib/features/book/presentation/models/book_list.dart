class BookListCardModel {
  final int id;
  final String name;
  final String? coverImage;
  final DateTime lastModified;

  BookListCardModel({
    required this.id,
    required this.name,
    this.coverImage,
    required this.lastModified,
  });
}
