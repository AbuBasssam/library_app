import 'package:flutter/material.dart';
import 'package:library_app/core/helper/spacing.dart';
import 'package:library_app/feature/book/domain/entities/book_entity.dart';
import 'package:library_app/feature/book/presentation/en_book_card_type.dart';
import 'package:library_app/feature/book/presentation/widgets/book_card.dart';

class HomeBookList extends StatelessWidget {
  final List<BookEntity> books;
  const HomeBookList({super.key, required this.books});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => BookCard(
        model: BookEntity(
            imageUrl: books[index].imageUrl, // 'https://picsum.photos/152/200',
            isNew: books[index].isNew, //true,
            title: books[index].title, //'Atomic Habits',
            author: books[index].author //'James Clear',
            ),
        type: enBookCardType.home,
      ),
      separatorBuilder: (context, index) => horizontalSpace(12),
      itemCount: books.length,
      scrollDirection: Axis.horizontal,
    );
  }
}
