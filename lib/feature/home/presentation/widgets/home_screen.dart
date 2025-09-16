import 'package:flutter/material.dart';
import 'package:library_app/core/helper/spacing.dart';
import 'package:library_app/feature/home/domain/entities/book_category.dart';
import 'package:library_app/feature/home/presentation/widgets/app_bottom_navigation_bar.dart';
import 'package:library_app/feature/home/presentation/widgets/categories_section.dart';
import 'package:library_app/feature/home/presentation/widgets/category_books_section.dart';
import 'package:library_app/feature/home/presentation/widgets/collapse_welcome_section.dart';
import 'package:library_app/feature/home/presentation/widgets/home_screen_app_bar.dart';
import 'package:library_app/feature/home/presentation/widgets/most_popular_books_section.dart';
import 'package:library_app/feature/home/presentation/widgets/newest_books_section.dart';
import 'package:library_app/feature/home/presentation/widgets/pinned_search_bar.dart';
import 'package:library_app/feature/home/presentation/widgets/section_separator.dart';
import '../../../book/domain/entities/book_entity.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample categories data with mock data
    final categories = <BookCategory>[
      BookCategory(id: 1, name: 'Romance'),
      BookCategory(id: 2, name: 'Fantasy'),
      BookCategory(id: 3, name: 'Mystery'),
      BookCategory(id: 4, name: 'Programming'),
      BookCategory(id: 5, name: 'Economic'),
      BookCategory(id: 6, name: 'History'),
      BookCategory(id: 7, name: 'Science')
    ];
    final books = <BookEntity>[
      BookEntity(
        imageUrl: 'https://picsum.photos/160/202',
        isNew: true,
        title: 'Atomic Habits',
        author: 'James Clear',
      ),
      BookEntity(
        imageUrl: 'https://picsum.photos/160/202',
        isNew: false,
        title: 'The Subtle Art of Not Giving a F*ck',
        author: 'Mark Manson',
      ),
      BookEntity(
        imageUrl: 'https://picsum.photos/160/202',
        isNew: true,
        title: 'Deep Work',
        author: 'Cal Newport',
      ),
      BookEntity(
        imageUrl: 'https://picsum.photos/160/202',
        isNew: false,
        title: 'Thinking, Fast and Slow',
        author: 'Daniel Kahneman',
      ),
      BookEntity(
        imageUrl: 'https://picsum.photos/160/202',
        isNew: true,
        title: 'Grit',
        author: 'Angela Duckworth',
      ),
    ];
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            HomeScreenAppBar(),
            SliverToBoxAdapter(child: verticalSpace(12)),
            CollapseWelcomeSection(),
            SliverToBoxAdapter(child: verticalSpace(20)),
            PinnedSearchBar(),
            SliverToBoxAdapter(child: verticalSpace(20)),
            SliverToBoxAdapter(
              child: CategoriesSection(categories: categories),
            ),
            SliverToBoxAdapter(child: verticalSpace(32)),
            SliverToBoxAdapter(child: CategoryBooksSection(books: books)),
            SliverToBoxAdapter(child: SectionSeparator()),
            SliverToBoxAdapter(child: MostPopularBooksSection(books: books)),
            SliverToBoxAdapter(child: SectionSeparator()),
            SliverToBoxAdapter(child: NewestBooksSection(books: books)),
            SliverToBoxAdapter(child: verticalSpace(32)),
          ],
        ),
      ),
      bottomNavigationBar: AppBottomNavigationBar(),
    );
  }
}
