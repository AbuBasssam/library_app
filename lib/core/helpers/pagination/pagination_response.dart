import 'package:json_annotation/json_annotation.dart';
part 'pagination_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class PaginationResult<T> {
  /// Total number of items across all pages
  final int totalCount;

  /// Current page number (1-based)
  final int page;

  /// Number of items per page
  final int pageSize;

  /// Total number of pages
  final int totalPages;

  /// Additional metadata for the paginated result
  final dynamic metadata;

  /// The items in the current page
  final List<T> items;

  const PaginationResult({
    required this.totalCount,
    required this.page,
    required this.pageSize,
    required this.totalPages,
    this.metadata,
    required this.items,
  });

  /// From JSON
  factory PaginationResult.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$PaginationResultFromJson(json, fromJsonT);

  /// Whether there is a previous page
  bool get hasPrevious => page > 1;

  /// Whether there is a next page
  bool get hasNext => page < totalPages;

  /// Whether this is the first page
  bool get isFirst => page == 1;

  /// Whether this is the last page
  bool get isLast => page == totalPages;

  /// Number of items in the current page
  int get currentPageSize => items.length;

  /// Whether the result has any items
  bool get hasItems => items.isNotEmpty;

  /// Whether the result is empty
  bool get isEmpty => items.isEmpty;
}
