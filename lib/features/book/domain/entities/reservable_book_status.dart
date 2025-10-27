import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:library_app/features/book/domain/abstracts/book_status.dart';
part 'reservable_book_status.g.dart';

@JsonSerializable()
class ReservableBookStatus extends BookStatus {
  final int waitingListCount;
  final int estimatedDays;

  ReservableBookStatus({
    required this.waitingListCount,
    required this.estimatedDays,
  });
  factory ReservableBookStatus.fromJson(Map<String, dynamic> json) =>
      _$ReservableBookStatusFromJson(json);
  Map<String, dynamic> toJson() => _$ReservableBookStatusToJson(this);
}
