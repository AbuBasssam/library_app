import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../../../core/helpers/spacing.dart';
import '/features/book/domain/entities/book_entity.dart';
import '/features/book/presentation/en_book_card_type.dart';
import '/features/book/presentation/widgets/book_card.dart';

class HomeBookList extends StatefulWidget {
  final List<BookEntity> books;
  final VoidCallback? scrollBehavior;
  const HomeBookList({super.key, required this.books, this.scrollBehavior});

  @override
  State<HomeBookList> createState() => _HomeBookListState();
}

class _HomeBookListState extends State<HomeBookList> {
  late ScrollController _scrollController;
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  Timer? _debounce;

  void _onScroll() {
    var currentPosition = _scrollController.position.pixels;
    var seventyPercentBookListLength =
        _scrollController.position.maxScrollExtent * 0.7;
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 300), () {
      if (currentPosition >= seventyPercentBookListLength) {
        if (!isLoading) {
          isLoading = true;
          widget.scrollBehavior?.call();
          isLoading = false;
          setState(() {});
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      controller: _scrollController,
      itemCount: widget.books.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => BookCard(
        model: BookEntity(
          imageUrl: widget.books[index].imageUrl,
          isNew: widget.books[index].isNew,
          title: widget.books[index].title,
          author: widget.books[index].author,
        ),
        type: enBookCardType.home,
      ),
      separatorBuilder: (context, index) => horizontalSpace(12),
    );
  }
}
