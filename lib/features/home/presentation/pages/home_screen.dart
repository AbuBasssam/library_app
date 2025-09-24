import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/core/theme/app_colors.dart';
import 'package:library_app/features/home/domain/entities/home_data_entity.dart';
import 'package:library_app/features/home/presentation/blocs/home_data_cubit/home_data_cubit.dart';
import 'package:library_app/features/home/presentation/blocs/home_data_cubit/home_data_state.dart';
import '../../../../core/helpers/spacing.dart';
import '../widgets/categories_section.dart';
import '../widgets/category_books_section.dart';
import '../widgets/collapse_welcome_section.dart';
import '../widgets/home_screen_app_bar.dart';
import '../widgets/most_popular_books_section.dart';
import '../widgets/newest_books_section.dart';
import '../widgets/pinned_search_bar.dart';
import '../widgets/section_separator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<HomeDataCubit>().getHomeData();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeDataCubit, HomeDataState>(
      buildWhen: (previous, current) => current.maybeWhen(
        initial: () => true,
        loading: () => true,
        success: (_) => true,
        failure: (_) => true,
        orElse: () => false,
      ),
      builder: (context, state) => state.maybeWhen(
          loading: loadingDialogWidget,
          success: (data) {
            var dataEntity = data as HomeDataEntity;
            return Scaffold(
                body: SafeArea(
              child: CustomScrollView(
                slivers: [
                  HomeScreenAppBar(
                    notificationCount: dataEntity.notificationCount,
                  ),
                  SliverToBoxAdapter(child: verticalSpace(12)),
                  CollapseWelcomeSection(),
                  SliverToBoxAdapter(child: verticalSpace(20)),
                  PinnedSearchBar(),
                  SliverToBoxAdapter(child: verticalSpace(20)),

                  /* 
                  SliverToBoxAdapter(
                    child: BlocProvider(
                      create: (context) => CategoryBooksCubit(
                        getIt<IHomeRepository>(),
                        dataEntity.categoryBooksSection,
                      ),
                      child: EnhancedCategoryBooksSection(
                        categories: dataEntity.categories,
                        
                      ),
                    ),
                  ),*/

                  //Books by Category section
                  SliverToBoxAdapter(
                    child: CategoriesSection(
                      categories: dataEntity.categories,
                    ),
                  ),
                  SliverToBoxAdapter(child: verticalSpace(32)),
                  SliverToBoxAdapter(
                    child: CategoryBooksSection(
                        books: dataEntity.categoryBooksSection.items),
                  ),
                  SliverToBoxAdapter(child: SectionSeparator()),

                  // Top Rated Book Section
                  SliverToBoxAdapter(
                      child: MostPopularBooksSection(
                          books: dataEntity.mostPopularBooksSection)),
                  SliverToBoxAdapter(child: SectionSeparator()),

                  // Newest Books Section
                  SliverToBoxAdapter(
                    child: NewestBooksSection(
                      books: dataEntity.newestBooksSection.items,
                    ),
                  ),
                  SliverToBoxAdapter(child: verticalSpace(32)),
                ],
              ),
            ) //;
                //bottomNavigationBar: AppBottomNavigationBar(),
                );
          },
          failure: (message) => Scaffold(body: Center(child: Text(message))),
          orElse: () => Center(child: Text("no Internet connection"))),
    );
    //);
    //   },
    // );
  }

  Scaffold loadingDialogWidget() {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(color: AppColors.mainBlue),
      ),
    );
  }
}
