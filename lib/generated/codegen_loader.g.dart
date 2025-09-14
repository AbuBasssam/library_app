// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes, avoid_renaming_method_parameters, constant_identifier_names

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> _ar = {
  "banner_new": "جديد",
  "Pages": "صفحات",
  "Readers": "قارئ",
  "explore_by_categories": "استكشف بالفئات",
  "time_ago": {
    "now": "الآن",
    "days_ago_single": "منذ يوم",
    "days_ago_dual": "منذ يومين",
    "days_ago_plural": "منذ {count} أيام",
    "days_ago_many": "منذ {count} يوماً",
    "hours_ago_single": "منذ ساعة",
    "hours_ago_dual": "منذ ساعتين",
    "hours_ago_plural": "منذ {count} ساعات",
    "hours_ago_many": "منذ {count} ساعة",
    "minutes_ago_single": "منذ دقيقة",
    "minutes_ago_dual": "منذ دقيقتين",
    "minutes_ago_plural": "منذ {count} دقائق",
    "minutes_ago_many": "منذ {count} دقيقة"
  }
};
static const Map<String,dynamic> _en = {
  "banner_new": "New",
  "pages": "Pages",
  "Readers": "Readers",
  "explore_by_categories": "Explore by Categories",
  "time_ago": {
    "now": "Now",
    "days_ago_single": "1 day ago",
    "days_ago_dual": "2 days ago",
    "days_ago_plural": "{count} days ago",
    "days_ago_many": "{count} days ago",
    "hours_ago_single": "1 hour ago",
    "hours_ago_dual": "2 hours ago",
    "hours_ago_plural": "{count} hours ago",
    "hours_ago_many": "{count} hours ago",
    "minutes_ago_single": "1 minute ago",
    "minutes_ago_dual": "2 minutes ago",
    "minutes_ago_plural": "{count} minutes ago",
    "minutes_ago_many": "{count} minutes ago"
  }
};
static const Map<String, Map<String,dynamic>> mapLocales = {"ar": _ar, "en": _en};
}
