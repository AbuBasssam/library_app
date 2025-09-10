import 'package:flutter/material.dart';
import 'package:library_app/core/helper/extension.dart';
import 'package:library_app/feature/book/domain/entities/book_entity.dart';
import 'package:library_app/feature/book/presentation/strategies/book_card_strategy.dart';
import 'package:library_app/feature/book/presentation/view%20models/similar_books_view_info.dart';
import 'package:library_app/feature/book/presentation/widgets/similar_view_book_card.dart';

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
