import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:library_app/features/book/domain/abstracts/book_status.dart';
part 'borrowed_book_status.g.dart';

@JsonSerializable()
class BorrowedBookStatus extends BookStatus {
  final int borrowId;
  final DateTime borrowDate;
  final DateTime dueDate;
  final int maxExtensionCount;
  final int maxExtensionDays;
  final int maxBorrowingDays;
  final bool canExtend;
  final String? disableReason;

  BorrowedBookStatus({
    required this.borrowId,
    required this.borrowDate,
    required this.dueDate,
    required this.maxExtensionCount,
    required this.maxExtensionDays,
    required this.maxBorrowingDays,
    required this.canExtend,
    required this.disableReason,
  });

  factory BorrowedBookStatus.fromJson(Map<String, dynamic> json) =>
      _$BorrowedBookStatusFromJson(json);
  Map<String, dynamic> tojson() => _$BorrowedBookStatusToJson(this);
}
