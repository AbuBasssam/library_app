import 'package:flutter/material.dart';
import '../../domain/entities/book_entity.dart';

abstract class IBookCardStrategy {
  Widget buildCard(BookEntity entity);
}

abstract class BookCardStrategy<T> implements IBookCardStrategy {
  T? toStrategyInfo(BookEntity entity);
  Widget buildStrategy(T info);

  @override
  Widget buildCard(BookEntity entity) {
    final info = toStrategyInfo(entity);
    if (info == null) {
      throw ArgumentError(
        "Cannot build $runtimeType: missing required fields",
      );
    }
    return buildStrategy(info);
  }
}
