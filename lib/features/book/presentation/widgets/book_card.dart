import 'package:flutter/material.dart';
import '/features/book/domain/entities/book_entity.dart';
import '/features/book/presentation/book_card_builder.dart';
import '/features/book/presentation/en_book_card_type.dart';

class BookCard extends StatelessWidget {
  final BookEntity model;
  final enBookCardType type;

  const BookCard({
    super.key,
    required this.model,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    final strategy = BookCardBuilder.getStrategy(type);
    return strategy.buildCard(model);
  }
}
