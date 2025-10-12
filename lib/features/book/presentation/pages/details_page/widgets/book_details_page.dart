import 'dart:convert';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:library_app/core/helpers/app_strings.dart';
import 'package:library_app/core/theme/app_colors.dart';
import 'package:library_app/features/book/domain/entities/book_entity.dart';
import 'package:library_app/features/book/presentation/en_book_card_type.dart';
import 'package:library_app/features/book/presentation/widgets/book_card.dart';
import 'package:library_app/features/book/presentation/widgets/book_status_badge.dart';
import 'package:library_app/generated/locale_keys.g.dart';

class BookDetailsPage extends StatefulWidget {
  const BookDetailsPage({super.key});

  @override
  State<BookDetailsPage> createState() => _BookDetailsPageState();
}

class _BookDetailsPageState extends State<BookDetailsPage> {
  BookEntity? _book;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadBookData();
  }

  Future<void> _loadBookData() async {
    final jsonString = await rootBundle.loadString(
      AppStrings.borrowableBookDetails,
    );
    final jsonMap = jsonDecode(jsonString);
    final data = jsonMap['data'];
    setState(() {
      _book = BookEntity.fromJson(data);
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        leading: IconButton(
          onPressed: GoRouter.of(context).pop,
          icon: const Icon(Icons.arrow_back_sharp),
        ),
        title: Center(child: Text(LocaleKeys.book_details_title.tr())),
        toolbarHeight: 35.h,
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(top: 16.h),
                        child: BookStatusBadge(state: _book!.state!),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.only(top: 8.h, bottom: 16.h),
                      child: BookCard(
                        model: _book!,
                        type: enBookCardType.detail,
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
