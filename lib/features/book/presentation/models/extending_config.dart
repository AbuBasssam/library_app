class ExtendingConfig {
  final int borrowId;
  final DateTime borrowDate;
  final DateTime dueDate;
  final int maxExtensionCount;
  final int maxExtensionDays;
  final int maxBorrowingDays;
  final bool canExtend;
  final String? disableReason;

  const ExtendingConfig({
    required this.borrowId,
    required this.borrowDate,
    required this.dueDate,
    required this.maxExtensionCount,
    required this.maxExtensionDays,
    required this.maxBorrowingDays,
    required this.canExtend,
    this.disableReason,
  });

  /// Number of days already borrowed (from borrowDate until now)
  int get daysBorrowed {
    return DateTime.now().difference(borrowDate).inDays;
  }

  /// Number of days remaining until due date
  int get daysRemaining {
    final remaining = dueDate.difference(DateTime.now()).inDays;
    return remaining < 0 ? 0 : remaining;
  }

  /// Should show days remaining indicator (if < 7 days)
  bool get shouldShowDaysRemaining {
    return daysRemaining < 7;
  }

  /// Is urgency high (< 3 days)?
  bool get isUrgent {
    return daysRemaining < 3;
  }

  /// Calculate available extend options based on maxExtensionDays
  List<int> get predefinedExtendOptions {
    final min = (maxExtensionDays / 3).round();
    final recommended = (maxExtensionDays / 2).round();
    final max = maxExtensionDays;

    return [min, recommended, max];
  }

  /// Get the recommended option (middle one)
  int get recommendedExtendDays {
    return predefinedExtendOptions[1];
  }

  /// Calculate total days after extension
  int totalDaysAfterExtend(int extendDays) {
    return daysBorrowed + daysRemaining + extendDays;
  }

  /// Check if extend days is within limit
  bool isValidExtendDays(int days) {
    if (days < 1 || days > maxExtensionDays) return false;

    final totalAfter = totalDaysAfterExtend(days);
    return totalAfter <= maxBorrowingDays;
  }

  /// Get maximum allowed extend days considering total limit
  int get maxAllowedExtendDays {
    final remainingFromTotal =
        maxBorrowingDays - (daysBorrowed + daysRemaining);
    return remainingFromTotal < maxExtensionDays
        ? remainingFromTotal
        : maxExtensionDays;
  }

  /// Calculate new due date after extension
  DateTime calculateNewDueDate(int extendDays) {
    return dueDate.add(Duration(days: extendDays));
  }
}
