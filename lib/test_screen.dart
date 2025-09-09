import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:library_app/feature/book/domain/entities/book_entity.dart';
import 'package:library_app/feature/book/presentation/widgets/book_card.dart';
import 'feature/book/presentation/en_book_card_type.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
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
          type: enBookCardType.recentSearch,
        ),
      ),
      /*SizedBox(
        height: 300.h,
        child: ListView.separated(
          itemCount: 10,
          scrollDirection: Axis.vertical,
          separatorBuilder: (context, index) => SizedBox(width: 25.w),
          itemBuilder: (context, index) => BookCard(
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
            type: enBookCardType.recentSearch,
          ),
        ),
      ),*/
    );

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
