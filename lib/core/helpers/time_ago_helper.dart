import 'package:easy_localization/easy_localization.dart';
import 'package:library_app/generated/locale_keys.g.dart';

class TimeAgoHelper {
  TimeAgoHelper._();

  /// Calculate time indicator
  static String timeAgo(DateTime searchedAt) {
    final now = DateTime.now();
    final difference = now.difference(searchedAt);

    if (difference.inDays > 0) {
      return _formatDays(difference.inDays);
    } else if (difference.inHours > 0) {
      return _formatHours(difference.inHours);
    } else if (difference.inMinutes > 0) {
      return _formatMinutes(difference.inMinutes);
    } else {
      return LocaleKeys.time_ago_now.tr();
    }
  }

  /// Format days diff
  static String _formatDays(int days) {
    if (days == 1) {
      return LocaleKeys.time_ago_days_ago_plural.tr();
    } else if (days == 2) {
      return LocaleKeys.time_ago_days_ago_dual.tr();
    } else if (days >= 3 && days <= 10) {
      return LocaleKeys.time_ago_days_ago_plural.tr(
        namedArgs: {
          'count': days.toString(),
        },
      );
    } else {
      return LocaleKeys.time_ago_days_ago_many.tr(
        namedArgs: {
          'count': days.toString(),
        },
      );
    }
  }

  /// Format hours diff
  static String _formatHours(int hours) {
    if (hours == 1) {
      return LocaleKeys.time_ago_hours_ago_single.tr();
    } else if (hours == 2) {
      return LocaleKeys.time_ago_hours_ago_dual.tr();
    } else if (hours >= 3 && hours <= 10) {
      return LocaleKeys.time_ago_hours_ago_plural.tr(
        namedArgs: {
          'count': hours.toString(),
        },
      );
    } else {
      return LocaleKeys.time_ago_hours_ago_many.tr(
        namedArgs: {
          'count': hours.toString(),
        },
      );
    }
  }

  /// Format minutes diff
  static String _formatMinutes(int minutes) {
    if (minutes == 1) {
      return LocaleKeys.time_ago_minutes_ago_single.tr();
    } else if (minutes == 2) {
      return LocaleKeys.time_ago_minutes_ago_dual.tr();
    } else if (minutes >= 3 && minutes <= 10) {
      return LocaleKeys.time_ago_minutes_ago_plural.tr(
        namedArgs: {
          'count': minutes.toString(),
        },
      );
    } else {
      return LocaleKeys.time_ago_minutes_ago_many.tr(
        namedArgs: {
          'count': minutes.toString(),
        },
      );
    }
  }
}
