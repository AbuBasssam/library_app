import 'package:flutter/material.dart';
import 'package:library_app/features/book/domain/abstracts/book_status.dart';
import 'package:library_app/features/book/presentation/strategies/book_state/book_state_strategy_factory.dart';

class BookStateWidget extends StatelessWidget {
  final BookStatus bookStatus;

  const BookStateWidget({
    super.key,
    required this.bookStatus,
  });

  @override
  Widget build(BuildContext context) {
    final strategy = BookStateStrategyFactory.create(bookStatus);
    return strategy.buildWidget(context);
  }
}
