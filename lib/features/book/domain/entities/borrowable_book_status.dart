import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:library_app/features/book/domain/abstracts/book_status.dart';
part 'borrowable_book_status.g.dart';

@JsonSerializable()
class BorrowableBookStatus extends BookStatus {
  final int maxBorrowingDuration;
  final int recommendedBorrowingDuration;
  final int pickupRequiredHours;
  final double finePerDay;

  BorrowableBookStatus({
    required this.maxBorrowingDuration,
    required this.recommendedBorrowingDuration,
    required this.pickupRequiredHours,
    required this.finePerDay,
  });
  Map<String, dynamic> toJson() => _$BorrowableBookStatusToJson(this);

  factory BorrowableBookStatus.fromJson(Map<String, dynamic> json) =>
      _$BorrowableBookStatusFromJson(json);
}
