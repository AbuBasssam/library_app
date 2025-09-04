import 'package:flutter/material.dart';
import 'package:library_app/feature/book/presentation/strategies/book_card_strategy.dart';
import 'package:library_app/feature/book/presentation/view%20models/home_view_info.dart';
import 'package:library_app/feature/book/presentation/widgets/home_view_book_card.dart';
import '../../domain/entities/book_entity.dart';

class HomeCardStrategy implements IBookCardStrategy {
  @override
  Widget buildCard(BookEntity entity) {
    return HomeViewBookCard(
      info: HomeViewInfo(
        coverInfo: entity.coverInfo,
        title: entity.title,
        author: entity.author,
      ),
    );
  }
}
