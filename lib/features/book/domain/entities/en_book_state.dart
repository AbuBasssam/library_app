import 'package:freezed_annotation/freezed_annotation.dart';

enum enBookState {
  @JsonValue(1)
  borrowable,
  @JsonValue(2)
  borrowed,
  @JsonValue(3)
  reservable,
  @JsonValue(4)
  reserved,
  @JsonValue(5)
  unavailable,
  @JsonValue(6)
  overdue;

  bool get canBorrow => this == enBookState.borrowable;
  bool get canReserve => this == enBookState.reservable;
  bool get isActive =>
      this == enBookState.borrowed || this == enBookState.reserved;
  bool get needsAction =>
      this == enBookState.overdue || this == enBookState.reserved;
  static enBookState fromint(int value) {
    switch (value) {
      case 1:
        return enBookState.borrowable;
      case 2:
        return enBookState.borrowed;
      case 3:
        return enBookState.reservable;
      case 4:
        return enBookState.reserved;
      case 5:
        return enBookState.unavailable;
      case 6:
        return enBookState.overdue;
      default:
        throw ArgumentError('Invalid book state: $value');
    }
  }
}
