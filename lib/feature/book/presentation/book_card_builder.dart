import 'en_book_card_type.dart';
import 'strategies/book_card_strategy.dart';
import 'strategies/home_card_strategy.dart';

class BookCardBuilder {
  static IBookCardStrategy getStrategy(enBookCardType type) {
    switch (type) {
      case enBookCardType.home:
        return HomeCardStrategy();
      case enBookCardType.detail:
      // return DetailCardStrategy();
      case enBookCardType.authorBooks:
      // return AuthorBooksCardStrategy();
      case enBookCardType.similarBooks:
      // return SimilarBooksCardStrategy();
      case enBookCardType.recentSearch:
      // return RecentSearchCardStrategy();
      case enBookCardType.mostSearched:
      // return MostSearchedCardStrategy();
      default:
        return HomeCardStrategy();
      // throw Exception('Book card type not found');
    }
  }
}
