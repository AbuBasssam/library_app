import 'package:flutter/material.dart';
import 'package:library_app/core/helper/book_entity_extensions.dart';
import 'package:library_app/feature/book/domain/entities/book_entity.dart';
import 'package:library_app/feature/book/presentation/strategies/book_card_strategy.dart';

import '../widgets/most_searched_book_card.dart';

class MostSearchedCardStrategy implements IBookCardStrategy {
  @override
  Widget buildCard(BookEntity entity) {
    final info = entity.toHomeViewInfo();
    if (info == null) {
      assert(false,
          "Cannot build MostSearchedCardStrategy: missing required fields");
    }

    return MostSearchedBookCard(info: info!);
  }
}
