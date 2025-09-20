import 'en_book_card_type.dart';
import 'strategies/author_books_card_strategy.dart';
import 'strategies/book_card_strategy.dart';
import 'strategies/details_card_strategy.dart';
import 'strategies/home_card_strategy.dart';
import 'strategies/most_searched_card_strategy.dart';
import 'strategies/recent_search_card_strategy.dart';
import 'strategies/similar_book_card_strategy.dart';

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
