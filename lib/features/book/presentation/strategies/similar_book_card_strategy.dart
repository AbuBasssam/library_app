import 'package:flutter/material.dart';
import '/core/helper/extension.dart';
import '/features/book/domain/entities/book_entity.dart';
import '/features/book/presentation/strategies/book_card_strategy.dart';
import '/features/book/presentation/view%20models/similar_books_view_info.dart';
import '/features/book/presentation/widgets/similar_view_book_card.dart';

class SimilarBookCardStrategy extends BookCardStrategy<SimilarBooksViewInfo> {
  @override
  Widget buildStrategy(SimilarBooksViewInfo info) {
    return SimilarViewBookCard(info: info);
  }

  @override
  SimilarBooksViewInfo? toStrategyInfo(BookEntity entity) {
    return entity.toSimilarBookViewInfo();
  }
}
