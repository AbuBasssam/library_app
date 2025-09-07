import 'package:flutter/material.dart';
import 'package:library_app/feature/book/domain/entities/book_entity.dart';
import 'package:library_app/feature/book/presentation/widgets/book_card.dart';
import 'feature/book/presentation/en_book_card_type.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: BookCard(
              model: BookEntity(
                imageUrl: 'https://picsum.photos/152/200',
                isNew: true,
                title: 'Atomic Habits',
                author: 'James Clear',
              ),
              type: enBookCardType.home,
            ),
          ),
        ],
      ),
    );
  }
}
