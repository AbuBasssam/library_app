import 'package:flutter/material.dart';
import 'package:library_app/core/helper/extension.dart';
import 'package:library_app/feature/book/presentation/strategies/book_card_strategy.dart';
import 'package:library_app/feature/book/presentation/widgets/home_view_book_card.dart';
import '../../domain/entities/book_entity.dart';

class HomeCardStrategy implements IBookCardStrategy {
  @override
  Widget buildCard(BookEntity entity) {
    final info = entity.toHomeViewInfo();
    if (info == null) {
      assert(false, "Cannot build HomeCardStrategy: missing required fields");
    }

    return HomeViewBookCard(info: info!);
  }
}
