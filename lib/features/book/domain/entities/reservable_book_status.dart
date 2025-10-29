import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:library_app/core/helpers/helper_methods.dart';
import 'package:library_app/features/book/domain/abstracts/book_status.dart';
part 'reservable_book_status.g.dart';

@JsonSerializable()
class ReservableBookStatus extends BookStatus {
  @JsonKey(name: 'peopleAhead')
  final int waitingListCount;
  final DateTime estimatedAvailableDate;

  int get estimatedDays => estimatedDaysCalculator(estimatedAvailableDate);

  ReservableBookStatus({
    required this.waitingListCount,
    required this.estimatedAvailableDate,
  });
  factory ReservableBookStatus.fromJson(Map<String, dynamic> json) =>
      _$ReservableBookStatusFromJson(json);
  Map<String, dynamic> toJson() => _$ReservableBookStatusToJson(this);
  // int _estimatedDaysCalculator(DateTime utcEstimatedAvailableDate) {
  //   final DateTime localeEstimatedAvailableDate =
  //       utcEstimatedAvailableDate.toLocal();
  //   final DateTime now = DateTime.now();
  //   final Duration difference = now.difference(localeEstimatedAvailableDate);

  //   // Return the number of days (rounded up for positive values)
  //   return difference.inDays;
  // }
}
