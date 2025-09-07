import 'package:flutter/material.dart';
import 'package:library_app/core/helper/book_entity_extensions.dart';
import 'package:library_app/feature/book/domain/entities/book_entity.dart';
import 'package:library_app/feature/book/presentation/strategies/book_card_strategy.dart';
import 'package:library_app/feature/book/presentation/widgets/details_view_book_card.dart';

class DetailsCardStrategy implements IBookCardStrategy {
  @override
  Widget buildCard(BookEntity entity) {
    final info = entity.toDetailViewInfo();
    if (info == null) {
      assert(
          false, "Cannot build DetailsCardStrategy: missing required fields");
    }

    return DetailsViewBookCard(info: info!);
  }
}
