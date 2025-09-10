import 'package:flutter/material.dart';
import 'package:library_app/core/helper/extension.dart';
import 'package:library_app/feature/book/domain/entities/book_entity.dart';
import 'package:library_app/feature/book/presentation/strategies/book_card_strategy.dart';
import 'package:library_app/feature/book/presentation/view%20models/detail_view_info.dart';
import 'package:library_app/feature/book/presentation/widgets/details_view_book_card.dart';

class DetailsCardStrategy extends BookCardStrategy<DetailViewInfo> {
  @override
  Widget buildStrategy(DetailViewInfo info) {
    return DetailsViewBookCard(info: info);
  }

  @override
  DetailViewInfo? toStrategyInfo(BookEntity entity) {
    return entity.toDetailViewInfo();
  }
  // @override
  // Widget buildCard(BookEntity entity) {
  //   final info = entity.toDetailViewInfo();
  //   if (info == null) {
  //     assert(
  //         false, "Cannot build DetailsCardStrategy: missing required fields");
  //   }

  //   return DetailsViewBookCard(info: info!);
  // }
}
