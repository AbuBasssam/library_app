import 'package:flutter/material.dart';
import '../../domain/entities/book_entity.dart';
import '../view models/home_view_info.dart';
import '../widgets/recent_search_book_card.dart';
import '/core/helper/extension.dart';
import 'book_card_strategy.dart';

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
