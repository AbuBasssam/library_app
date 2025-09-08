import 'package:flutter/material.dart';
import 'package:library_app/core/helper/book_entity_extensions.dart';
import 'package:library_app/feature/book/domain/entities/book_entity.dart';
import 'package:library_app/feature/book/presentation/strategies/book_card_strategy.dart';
import 'package:library_app/feature/book/presentation/widgets/similar_view_book_card.dart';

class SimilarBookCardStrategy implements IBookCardStrategy {
  @override
  Widget buildCard(BookEntity entity) {
    final info = entity.toSimilarBookViewInfo();
    if (info == null) {
      assert(false,
          "Cannot build SimilarBookCardStrategy: missing required fields");
    }
    return SimilarViewBookCard(info: info!);
  }
}
