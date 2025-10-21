class UserBookPreference {
  final int bookId;
  final int userRating;
  final bool isSaved;
  UserBookPreference({
    required this.bookId,
    required this.userRating,
    this.isSaved = false,
  });
}
