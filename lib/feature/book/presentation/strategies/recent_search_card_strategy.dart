import 'package:flutter/material.dart';
import 'package:library_app/core/helper/extension.dart';
import 'package:library_app/feature/book/domain/entities/book_entity.dart';
import 'package:library_app/feature/book/presentation/strategies/book_card_strategy.dart';
import 'package:library_app/feature/book/presentation/view%20models/home_view_info.dart';

import '../widgets/recent_search_book_card.dart';

class RecentSearchCardStrategy extends BookCardStrategy<HomeViewInfo> {
  @override
  Widget buildStrategy(HomeViewInfo info) {
    // Recent Search Books will be save localy with search time
    //for now use mock search Date

    return RecentSearchBookCard(
      info: info,
      searchDate: DateTime.now().add(Duration(days: -2)),
    );
  }

  @override
  HomeViewInfo? toStrategyInfo(BookEntity entity) {
    return entity.toHomeViewInfo();
  }
}
