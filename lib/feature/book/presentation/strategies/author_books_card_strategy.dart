import 'package:flutter/material.dart';
import 'package:library_app/core/helper/extension.dart';
import 'package:library_app/feature/book/domain/entities/book_entity.dart';
import 'package:library_app/feature/book/presentation/strategies/book_card_strategy.dart';

import '../view models/author_book_view_info.dart';
import '../widgets/author_book_view_book_card.dart';

class AuthorBookCardStrategy extends BookCardStrategy<AuthorBookViewInfo> {
  @override
  AuthorBookViewInfo? toStrategyInfo(BookEntity entity) {
    return entity.toAuthorBooksViewInfo();
  }

  @override
  Widget buildStrategy(AuthorBookViewInfo info) {
    return AuthorBookViewBookCard(info: info);
  }
}
