class BookCard {
  final String id;
  final String title;
  final String author;
  final String imageUrl;
  final bool isNew;
  final DateTime? publishDate;
  final int? pagesCount;
  final String? publisher;
  final String? language;
  final String? category;
  final double? rating;
  final int? readersCount;
  final DateTime? searchDate;
  BookCard({
    required this.id,
    required this.title,
    required this.author,
    required this.imageUrl,
    this.isNew = false,
    this.publishDate,
    this.pagesCount,
    this.publisher,
    this.language,
    this.category,
    this.rating,
    this.readersCount,
    this.searchDate,
  });
}
