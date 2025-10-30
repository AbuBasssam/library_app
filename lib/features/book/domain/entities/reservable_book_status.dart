import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:library_app/core/helpers/helper_methods.dart';
import 'package:library_app/features/book/domain/abstracts/book_status.dart';
part 'reservable_book_status.g.dart';

@JsonSerializable()
class ReservableBookStatus extends BookStatus {
  final DateTime estimatedAvailableDate;
  final int maxActiveReservations;
  final bool canReserve;
  final String? disableReason;

  @JsonKey(name: 'pickupExpiryHours')
  final int pickupWindowHours;

  @JsonKey(name: 'peopleAhead')
  final int waitingListCount;

  int get estimatedDays => estimatedDaysCalculator(estimatedAvailableDate);

  ReservableBookStatus(
    this.disableReason, {
    required this.canReserve,
    required this.pickupWindowHours,
    required this.maxActiveReservations,
    required this.waitingListCount,
    required this.estimatedAvailableDate,
  });
  factory ReservableBookStatus.fromJson(Map<String, dynamic> json) =>
      _$ReservableBookStatusFromJson(json);
  Map<String, dynamic> toJson() => _$ReservableBookStatusToJson(this);
}
