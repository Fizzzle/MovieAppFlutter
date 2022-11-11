import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:movie/services/movie_service.dart';

// модуль
import '../model/main_page_data.dart';

// сервис
import 'package:flutter/services.dart';

import '../model/movie.dart';

class MainPageDataController extends StateNotifier<MainPageData> {
  MainPageDataController([MainPageData? state])
      : super(state ?? MainPageData.inital()) {
    getMovie();
  }
  final MovieService _movieService = GetIt.instance.get<MovieService>();

  Future<void> getMovie() async {
    try {
      List<Movie> _movie = [];
      _movie = await _movieService.getPopularMovie(page: state.page);
      //
    } catch (e) {}
  }
}
