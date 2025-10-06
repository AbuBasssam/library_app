import 'package:json_annotation/json_annotation.dart';

part 'book_meta.g.dart';

@JsonSerializable()
class BookMeta {
  // Borrowable state
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

  const BookMeta({
    this.maxBorrowingDuration,
    this.recommededBorrowingDuration,
    this.pickupRequiredHours,
    this.finePerDay,
    this.dueDate,
    this.estimatedFine,
    this.estimatedAvailableDate,
    this.peopleAhead,
    this.pickupTimeRemainder,
  });

  factory BookMeta.fromJson(Map<String, dynamic> json) =>
      _$BookMetaFromJson(json);

  Map<String, dynamic> toJson() => _$BookMetaToJson(this);
}
