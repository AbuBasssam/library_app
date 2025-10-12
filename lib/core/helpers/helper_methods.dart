import 'package:library_app/core/helpers/app_strings.dart';

String getCategoryIcon(int categoryId) {
  switch (categoryId) {
    case 1:
      return AppStrings.icRomance;
    case 2:
      return AppStrings.icFantasy;
    case 3:
      return AppStrings.icMystery;
    case 4:
      return AppStrings.icProgramming;
    case 5:
      return AppStrings.icEconomic;
    case 6:
      return AppStrings.icHistory;
    case 7:
      return AppStrings.icScience;
    default:
      return AppStrings.icBook;
  }
}
