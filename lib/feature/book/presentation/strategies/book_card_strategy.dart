import 'package:flutter/material.dart';
import '../../domain/entities/book_entity.dart';

abstract class IBookCardStrategy {
  Widget buildCard(BookEntity entity);
}
