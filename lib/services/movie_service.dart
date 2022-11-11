import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import './http_service.dart';

import '../model/movie.dart';

class MovieService {
  final GetIt getIt = GetIt.instance;

  late HTTPService _http;

  MovieService() {
    _http = getIt.get<HTTPService>();
  }

  Future<List<Movie>> getPopularMovie({required int page}) async {
    Response _response = await _http.get('/movie/popular', query: {
      page: page,
    });
    if (_response.statusCode == 200) {
      Map _data = _response.data;
      List<Movie> _movie = _data['results'].map<Movie>((_movieData) {
        return Movie.fromJson(_movieData);
      }).toList();
      return _movie;
    } else {
      throw Exception('Couldt load popular movies');
    }
  }
}
