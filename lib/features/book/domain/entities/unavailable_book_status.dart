import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:library_app/features/book/domain/abstracts/book_status.dart';
part 'unavailable_book_status.g.dart';

@JsonSerializable()
class UnavailableBookStatus extends BookStatus {
  UnavailableBookStatus();

  factory UnavailableBookStatus.fromjson(Map<String, dynamic> json) =>
      _$UnavailableBookStatusFromJson(json);

  Map<String, dynamic> tojson() => _$UnavailableBookStatusToJson(this);
}
