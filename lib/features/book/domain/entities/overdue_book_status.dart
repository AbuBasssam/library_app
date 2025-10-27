import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:library_app/features/book/domain/abstracts/book_status.dart';
part 'overdue_book_status.g.dart';

@JsonSerializable()
class OverdueBookStatus extends BookStatus {
  final DateTime dueDate;
  final double lateFee;

  OverdueBookStatus({required this.dueDate, required this.lateFee});
  factory OverdueBookStatus.fromJson(Map<String, dynamic> json) =>
      _$OverdueBookStatusFromJson(json);
  Map<String, dynamic> tojson() => _$OverdueBookStatusToJson(this);
}
