import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:library_app/core/theme/app_colors.dart';
import 'package:library_app/features/home/presentation/blocs/newest_books_cubit/newest_books_cubit.dart';
import 'package:library_app/features/home/presentation/blocs/newest_books_cubit/newest_books_state.dart';
import '/generated/locale_keys.g.dart';
import '../../../../core/helpers/spacing.dart';
import 'home_book_list.dart';
import 'section_title.dart';

class NewestBooksSection extends StatelessWidget {
  //final List<BookEntity> books;
  const NewestBooksSection({super.key}); //required this.books

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      buildWhen: (previous, current) => current.maybeWhen(
        initial: () => true,
        loading: () => true,
        success: (_) => true,
        failure: (_) => true,
        orElse: () => false,
      ),
      builder: (context, state) => state.maybeWhen(
        initial: () => _IntialAndSuccessWidget(),
        loading: loadingDialogWidget,
        success: (_) => _IntialAndSuccessWidget(),
        failure: (message) => Center(
          child: Text(message),
        ),
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

class _IntialAndSuccessWidget extends StatelessWidget {
  const _IntialAndSuccessWidget(); //{required this.books}

  //final List<BookEntity> books;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionTitle(title: LocaleKeys.Newest.tr()),
          verticalSpace(12),
          SizedBox(
            height: 280.h,
            width: 393.w,
            child: HomeBookList(
              books: context.read<NewestBooksCubit>().newestBooks.toList(),
              scrollBehavior:
                  context.read<NewestBooksCubit>().fetchNextNewestBooksPage,
            ),
          ),
        ],
      ),
    );
  }
}
