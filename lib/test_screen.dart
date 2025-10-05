import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:library_app/features/home/presentation/pages/home_screen.dart';

import 'features/home/domain/entities/book_category.dart';
import 'features/home/presentation/widgets/book_category_card.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    /*final categories = List<BookCategory>() = [
      BookCategory(id: 1, name: 'Romance'),
      BookCategory(id: 2, name: 'Fantasy'),
      BookCategory(id: 3, name: 'Mystery'),
      BookCategory(id: 4, name: 'Programming'),
      BookCategory(id: 5, name: 'Economic'),
      BookCategory(id: 6, name: 'History'),
      BookCategory(id: 7, name: 'Science'),
      // Add more categories as needed
    ];*/
    return HomeScreen();
    //return Scaffold(
    // body:
    /*Center(
        child: BookCard(
          model: BookEntity(
            imageUrl: 'https://picsum.photos/152/200',
            isNew: true,
            title: 'Atomic Habits',
            author: 'James Clear',
            publisher: 'Avery',
            publishDate: DateTime(2018, 10, 16),
            pagesCount: 320,
            isbn: '978-0735211292',
            language: 'English',
            category: 'Self-Help',
            rating: 4.85,
            readersCount: 1247,
          ),
          type: enBookCardType.detail,
        ),
      ),*/
    //BookCategoriesGrid(),
    //       Padding(
    //     padding: EdgeInsets.only(top: 46.h),
    //     child: Column(
    //       children: [
    //         TopNavigationBar(notificationCount: 0),
    //         verticalSpace(12),
    //         WelcomeSection(),
    //         verticalSpace(20),
    //         SearchSection(),
    //         verticalSpace(32),
    //         CategoriesSection(categories: categories),
    //       ],
    //     ),
    //   ),
    // );

    //             model: BookEntity(
    //               imageUrl: 'https://picsum.photos/152/200',
    //               isNew: true,
    //               title: 'Atomic Habits',
    //               author: 'James Clear',
    //               publisher: 'Avery',
    //               publishDate: DateTime(2018, 10, 16),
    //               pagesCount: 320,
    //               isbn: '978-0735211292',
    //               language: 'English',
    //               category: 'Self-Help',
    //               rating: 4.85,
    //               readersCount: 1247,
    //             ),
    //             type: enBookCardType.authorBooks,
    //           )BookCard(
    //             model: BookEntity(
    //               imageUrl: 'https://picsum.photos/152/200',
    //               isNew: true,
    //               title: 'Atomic Habits',
    //               author: 'James Clear',
    //               publisher: 'Avery',
    //               publishDate: DateTime(2018, 10, 16),
    //               pagesCount: 320,
    //               isbn: '978-0735211292',
    //               language: 'English',
    //               category: 'Self-Help',
    //               rating: 4.85,
    //               readersCount: 1247,
    //             ),
    //             type: enBookCardType.authorBooks,
    //           ) ,
    // body: Column(
    //   mainAxisAlignment: MainAxisAlignment.center,
    //   children: [
    //     SizedBox(
    //       height: 275.h,
    //       child: ListView.separated(
    //         itemCount: 5,
    //         scrollDirection: Axis.horizontal,
    //         separatorBuilder: (context, index) => SizedBox(width: 25.w),
    //         itemBuilder: (context, index) => SizedBox(
    //           height: 225.h,
    //           child: BookCard(
    //             model: BookEntity(
    //               imageUrl: 'https://picsum.photos/152/200',
    //               isNew: true,
    //               title: 'Atomic Habits',
    //               author: 'James Clear',
    //               publisher: 'Avery',
    //               publishDate: DateTime(2018, 10, 16),
    //               pagesCount: 320,
    //               isbn: '978-0735211292',
    //               language: 'English',
    //               category: 'Self-Help',
    //               rating: 4.85,
    //               readersCount: 1247,
    //             ),
    //             type: enBookCardType.authorBooks,
    //           ),
    //         ),
    //       ),
    //     ),
    //   ],
    // ),
    //);
  }
}

class BookCategoriesGrid extends StatelessWidget {
  final Function(int)? onCategorySelected;

  const BookCategoriesGrid({
    super.key,
    this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    final categories = List<BookCategory>() = [
      BookCategory(id: 1, name: 'Romance'),
      BookCategory(id: 2, name: 'Fantasy'),
      BookCategory(id: 3, name: 'Mystery'),
      BookCategory(id: 4, name: 'Programming'),
      BookCategory(id: 5, name: 'Economic'),
      BookCategory(id: 6, name: 'History'),
      BookCategory(id: 7, name: 'Science'),
      // Add more categories as needed
    ];

    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 12.w,
        mainAxisSpacing: 12.h,
        childAspectRatio: 100 / 120,
      ),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        final category = categories[index];
        return BookCategoryCard(
          category: category,
        );
      },
    );
  }
}
