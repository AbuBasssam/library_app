import '../../domain/entities/book_entity.dart';
import '../../presentation/strategies/book_card_strategy.dart';
import '../view models/author_book_view_info.dart';
import '../widgets/author_book_view_book_card.dart';
import '/core/helper/extension.dart';
import 'package:flutter/material.dart';

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
