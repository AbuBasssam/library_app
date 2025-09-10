import 'package:flutter/material.dart';
import 'package:library_app/core/helper/extension.dart';
import 'package:library_app/feature/book/domain/entities/book_entity.dart';
import 'package:library_app/feature/book/presentation/strategies/book_card_strategy.dart';

import '../widgets/author_book_view_book_card.dart';

class AuthorBookCardStrategy implements IBookCardStrategy {
  @override
  Widget buildCard(BookEntity entity) {
    final info = entity.toAuthorBooksViewInfo();
    if (info == null) {
      assert(
        false,
        "Cannot build AuthorBooksCardStrategy: missing required fields",
      );
    }
    return AuthorBookViewBookCard(info: info!);
  }
}
