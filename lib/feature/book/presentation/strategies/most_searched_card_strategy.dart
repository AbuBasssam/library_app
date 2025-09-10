import 'package:flutter/material.dart';
import 'package:library_app/core/helper/extension.dart';
import 'package:library_app/feature/book/domain/entities/book_entity.dart';
import 'package:library_app/feature/book/presentation/strategies/book_card_strategy.dart';
import 'package:library_app/feature/book/presentation/view%20models/most_search_view_info.dart';

import '../widgets/most_searched_book_card.dart';

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
