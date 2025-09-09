import 'package:flutter/material.dart';
import 'package:library_app/core/helper/book_entity_extensions.dart';
import 'package:library_app/feature/book/domain/entities/book_entity.dart';
import 'package:library_app/feature/book/presentation/strategies/book_card_strategy.dart';

import '../widgets/recent_search_book_card.dart';

class RecentSearchCardStrategy implements IBookCardStrategy {
  @override
  Widget buildCard(BookEntity entity) {
    final info = entity.toHomeViewInfo();
    if (info == null) {
      assert(
        false,
        "Cannot build RecentSearchCardStrategy: missing required fields",
      );
    }
    // Recent Search Books will be save localy with search time
    //for now use mock search Date

    return RecentSearchBookCard(
      info: info!,
      searchDate: DateTime.now().add(Duration(days: -2)),
    );
  }
}
