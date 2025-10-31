import 'package:library_app/features/book/domain/abstracts/book_state_strategy.dart';
import 'package:library_app/features/book/domain/abstracts/book_status.dart';
import 'package:library_app/features/book/domain/entities/borrowable_book_status.dart';
import 'package:library_app/features/book/domain/entities/borrowed_book_status.dart';
import 'package:library_app/features/book/domain/entities/overdue_book_status.dart';
import 'package:library_app/features/book/domain/entities/reservable_book_status.dart';
import 'package:library_app/features/book/domain/entities/reserved_book_status.dart';
import 'package:library_app/features/book/domain/entities/unavailable_book_status.dart';
import 'package:library_app/features/book/presentation/strategies/book_state/borrowable_book_strategy.dart';
import 'package:library_app/features/book/presentation/strategies/book_state/borrowed_book_strategy.dart';
import 'package:library_app/features/book/presentation/strategies/book_state/overdue_book_strategy.dart';
import 'package:library_app/features/book/presentation/strategies/book_state/reservable_book_strategy.dart';
import 'package:library_app/features/book/presentation/strategies/book_state/reserved_book_strategy.dart';
import 'package:library_app/features/book/presentation/strategies/book_state/unavailable_book_strategy.dart';

class BookStateStrategyFactory {
  static BookStateStrategy create(BookStatus status) {
    return switch (status) {
      BorrowableBookStatus s => BorrowableBookStrategy(s),
      BorrowedBookStatus s => BorrowedBookStrategy(s),
      ReservableBookStatus s => ReservableBookStrategy(s),
      ReservedBookStatus s => ReservedBookStrategy(s),
      OverdueBookStatus s => OverdueBookStrategy(s),
      UnavailableBookStatus s => UnavailableBookStrategy(s),
      _ => throw UnimplementedError(
          'Strategy not implemented for ${status.runtimeType}'),
    };
  }
}
