import 'package:json_annotation/json_annotation.dart';
part 'pagination_request.g.dart';

@JsonSerializable()
class PaginationRequest {
  final int pageNumber;
  final int pageSize;

  PaginationRequest({this.pageNumber = 1, this.pageSize = 10});
  Map<String, dynamic> toJson() => _$PaginationRequestToJson(this);
}
