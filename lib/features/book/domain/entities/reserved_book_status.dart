import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:library_app/features/book/domain/abstracts/book_status.dart';
part 'reserved_book_status.g.dart';

@JsonSerializable()
class ReservedBookStatus extends BookStatus {
  final Duration remainingTime;

  ReservedBookStatus({required this.remainingTime});
  factory ReservedBookStatus.fromJson(Map<String, dynamic> json) =>
      _$ReservedBookStatusFromJson(json);
  Map<String, dynamic> tojson() => _$ReservedBookStatusToJson(this);
}
