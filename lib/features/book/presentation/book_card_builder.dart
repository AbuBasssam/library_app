import 'en_book_card_type.dart';
import 'strategies/book_card/author_books_card_strategy.dart';
import '../domain/abstracts/book_card_strategy.dart';
import 'strategies/book_card/details_card_strategy.dart';
import 'strategies/book_card/home_card_strategy.dart';
import 'strategies/book_card/most_searched_card_strategy.dart';
import 'strategies/book_card/recent_search_card_strategy.dart';
import 'strategies/book_card/similar_book_card_strategy.dart';

class BookCardBuilder {
  BookCardBuilder._();
  static IBookCardStrategy getStrategy(enBookCardType type) {
    switch (type) {
      case enBookCardType.home:
        return HomeCardStrategy();
      case enBookCardType.detail:
        return DetailsCardStrategy();
      case enBookCardType.authorBooks:
        return AuthorBookCardStrategy();
      case enBookCardType.similarBooks:
        return SimilarBookCardStrategy();
      case enBookCardType.recentSearch:
        return RecentSearchCardStrategy();
      case enBookCardType.mostSearched:
        return MostSearchedCardStrategy();
    }
  }
}
