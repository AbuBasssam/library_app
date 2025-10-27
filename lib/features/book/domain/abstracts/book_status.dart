/*class BookStatus {
  final int? maxBorrowingDuration;
  final int? recommededBorrowingDuration;
  final int? pickupRequiredHours;
  final double? finePerDay;

  // Borrowed state
  final DateTime? dueDate;

  // Overdue state
  final double? estimatedFine;

  // Reservable state
  final DateTime? estimatedAvailableDate;
  final int? peopleAhead;

  // Reserved state
  final String? pickupTimeRemainder;

  // other information
  final enBookState state;
  final DateTime? searchDate;

  BookStatus({
    this.maxBorrowingDuration,
    this.recommededBorrowingDuration,
    this.pickupRequiredHours,
    this.finePerDay,
    this.dueDate,
    this.estimatedFine,
    this.estimatedAvailableDate,
    this.peopleAhead,
    this.pickupTimeRemainder,
    required this.state,
    this.searchDate,
  });
}*/
abstract class BookStatus {}
