import 'package:flutter/material.dart';
import '../../domain/entities/book_entity.dart';
import '../view models/most_search_view_info.dart';
import '../widgets/most_searched_book_card.dart';
import '/core/helpers/extension.dart';
import 'book_card_strategy.dart';

class MostSearchedCardStrategy extends BookCardStrategy<MostSearchViewInfo> {
  @override
  Widget buildStrategy(MostSearchViewInfo info) {
    return MostSearchedBookCard(info: info);
  }

  @override
  MostSearchViewInfo? toStrategyInfo(BookEntity entity) {
    return entity.mostSearchViewInfo;
  }
}
