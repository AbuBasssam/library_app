import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:library_app/core/helpers/error_state_dialog.dart';
import 'package:library_app/core/helpers/spacing.dart';
import 'package:library_app/core/theme/app_colors.dart';
import 'package:library_app/features/book/presentation/bloc/book_details_cubit/book_details_cubit.dart';
import 'package:library_app/features/book/presentation/bloc/book_details_cubit/book_details_state.dart';
import 'package:library_app/features/book/presentation/en_book_card_type.dart';
import 'package:library_app/features/book/presentation/pages/details_page/widgets/author_book_list.dart';
import 'package:library_app/features/book/presentation/pages/details_page/widgets/book_state_widget.dart';
import 'package:library_app/features/book/presentation/pages/details_page/widgets/expandable_description.dart';
import 'package:library_app/features/book/presentation/pages/details_page/widgets/rating_section.dart';
import 'package:library_app/features/book/presentation/pages/details_page/widgets/similar_book_list.dart';
import 'package:library_app/features/book/presentation/widgets/book_card.dart';
import 'package:library_app/features/book/presentation/widgets/book_status_badge.dart';
import 'package:library_app/generated/locale_keys.g.dart';

class BookDetailsPage extends StatefulWidget {
  final int bookId;
  const BookDetailsPage({super.key, required this.bookId});

  @override
  State<BookDetailsPage> createState() => _BookDetailsPageState();
}

class _BookDetailsPageState extends State<BookDetailsPage> {
  @override
  void initState() {
    super.initState();
    context.read<BookDetailsCubit>().emitBookDetailsStates(widget.bookId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookDetailsCubit, BookDetailsState>(
        buildWhen: (previous, current) => current.maybeWhen(
              initial: () => true,
              loading: () => true,
              success: (a, b, c, d) => true,
              failure: (_) => true,
              orElse: () => false,
            ),
        builder: (context, state) => state.maybeWhen(
              loading: () => Center(
                child: CircularProgressIndicator(color: AppColors.mainBlue),
              ),
              success: (details, status, pref, recommendations) => Scaffold(
                appBar: _detailsPageAppBar(context),
                body: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                        child: Align(
                          alignment: AlignmentDirectional.centerStart,
                          child: Padding(
                            padding: EdgeInsets.only(top: 16.h),
                            child: BookStatusBadge(state: status.state),
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: EdgeInsets.only(top: 8.h, bottom: 16.h),
                          child: BookCard(
                            model: details,
                            type: enBookCardType.detail,
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(child: verticalSpace(16)),
                      SliverToBoxAdapter(
                        child: BookStateWidget(bookStatus: status),
                      ),
                      SliverToBoxAdapter(child: verticalSpace(16)),
                      SliverToBoxAdapter(
                        child: RatingSection(rating: pref.userRating),
                      ),
                      SliverToBoxAdapter(child: verticalSpace(16)),
                      SliverToBoxAdapter(
                        child: ExpandableDescription(
                            description: details.description!),
                      ),
                      SliverToBoxAdapter(child: verticalSpace(24)),
                      SliverToBoxAdapter(
                        child: AuthorBookList(
                          authorName: details.author!,
                          books: recommendations.relatedBooks,
                        ),
                      ),
                      SliverToBoxAdapter(child: verticalSpace(24)),
                      SliverToBoxAdapter(
                        child: SimilarBookList(
                          books: recommendations.similarBooks,
                        ),
                      ),
                      SliverToBoxAdapter(child: verticalSpace(64)),
                    ],
                  ),
                ),
              ),
              failure: (message) => ErrorStateDialog(error: message),
              orElse: () => Center(child: Text("no Internet connection")),
            ));
  }

  AppBar _detailsPageAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.white,
      leading: IconButton(
        onPressed: GoRouter.of(context).pop,
        icon: const Icon(Icons.arrow_back_sharp),
      ),
      title: Center(child: Text(LocaleKeys.book_details_title.tr())),
      toolbarHeight: 35.h,
    );
  }
}
