import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/core/helpers/spacing.dart';
import 'package:library_app/core/theme/app_colors.dart';
import 'package:library_app/features/home/domain/entities/book_category.dart';
import 'package:library_app/features/home/presentation/blocs/books_by_category_cubit/category_books_cubit.dart';
import 'package:library_app/features/home/presentation/blocs/books_by_category_cubit/category_books_state.dart';
import 'package:library_app/features/home/presentation/widgets/categories_section.dart';
import 'package:library_app/features/home/presentation/widgets/category_books_section.dart';

class CategoryBooksSectionWithBooks extends StatelessWidget {
  final List<BookCategory> categories;

  const CategoryBooksSectionWithBooks({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBooksCubit, CategoryBooksState>(
      buildWhen: (previous, current) => current.maybeWhen(
        initial: () => true,
        loading: () => true,
        success: (_) => true,
        failure: (_) => true,
        orElse: () => false,
      ),
      builder: (context, state) => state.maybeWhen(
        initial: () => _SuccessWidget(categories: categories),
        loading: loadingDialogWidget,
        success: (_) => _SuccessWidget(categories: categories),
        failure: (message) => Scaffold(body: Center(child: Text(message))),
        orElse: () => Center(child: Text("no Internet connection")),
      ),
    );
  }

  Widget loadingDialogWidget() {
    return Center(
      child: CircularProgressIndicator(color: AppColors.mainBlue),
    );
  }
}

class _SuccessWidget extends StatelessWidget {
  const _SuccessWidget({required this.categories});

  final List<BookCategory> categories;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CategoriesSection(categories: categories),
        verticalSpace(32),
        CategoryBooksSection(
          books: context.read<CategoryBooksCubit>().books.toList(),
        ),
      ],
    );
  }
}
