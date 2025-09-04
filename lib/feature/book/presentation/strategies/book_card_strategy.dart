import 'package:flutter/material.dart';
import '../../domain/entities/book_card.dart';

abstract class IBookCardStrategy {
  Widget buildCard(BookCard card);
}
