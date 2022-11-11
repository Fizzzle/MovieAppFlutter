// Модули
import 'movie.dart';
import 'search_category.dart';

class MainPageData {
  final List<Movie> movie;
  final int page;
  final String searchCategory;
  final String searchText;

  MainPageData(
      {required this.movie,
      required this.page,
      required this.searchCategory,
      required this.searchText});

  MainPageData.inital()
      : movie = [],
        page = 1,
        searchCategory = SearchCategory.none,
        searchText = 'Последнее';

  MainPageData copyWith(
      List<Movie> movie, int page, String searchCategory, String searchText) {
    return MainPageData(
        movie: movie,
        page: page,
        searchCategory: searchCategory,
        searchText: searchText);
  }
}
