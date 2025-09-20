import 'package:flutter/material.dart';
import '../../presentation/widgets/home_view_book_card.dart';
import '../../domain/entities/book_entity.dart';
import '../view models/home_view_info.dart';
import '/core/helper/extension.dart';
import 'book_card_strategy.dart';

class HomeCardStrategy extends BookCardStrategy<HomeViewInfo> {
  @override
  Widget buildStrategy(HomeViewInfo info) {
    return HomeViewBookCard(info: info);
  }

  @override
  HomeViewInfo? toStrategyInfo(BookEntity entity) {
    return entity.toHomeViewInfo();
  }
}
