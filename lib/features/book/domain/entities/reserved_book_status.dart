import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:library_app/core/helpers/extension.dart';
import 'package:library_app/core/helpers/helper_methods.dart';
import 'package:library_app/features/book/domain/abstracts/book_status.dart';
part 'reserved_book_status.g.dart';

@JsonSerializable()
class ReservedBookStatus extends BookStatus {
  final int reservationId;
  final bool isReady;
  final DateTime? estimatedAvailableDate;

  @JsonKey(name: 'pickupTimeRemainder', fromJson: _parseDuration)
  final Duration? remainingTime;

  @JsonKey(name: 'peopleAhead')
  final int waitingListCount;

  ReservedBookStatus(
    this.estimatedAvailableDate,
    this.remainingTime, {
    required this.reservationId,
    required this.isReady,
    required this.waitingListCount,
  });
  factory ReservedBookStatus.fromJson(Map<String, dynamic> json) =>
      _$ReservedBookStatusFromJson(json);
  Map<String, dynamic> tojson() => _$ReservedBookStatusToJson(this);

  static Duration? _parseDuration(String? durationString) {
    if (durationString.isNullOrEmpty()) return null;
    final parts = durationString!.split(':');
    final hours = int.parse(parts[0]);
    final minutes = int.parse(parts[1]);
    final seconds = int.parse(parts[2]);

    return Duration(hours: hours, minutes: minutes, seconds: seconds);
  }

  int get estimatedDays => estimatedAvailableDate != null
      ? estimatedDaysCalculator(estimatedAvailableDate!)
      : 0;
}
