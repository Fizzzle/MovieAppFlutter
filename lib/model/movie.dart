// Пакеты
import 'package:get_it/get_it.dart';

// Модели
import 'app_config.dart';

class Movie {
  //
  final String name;
  final String language;
  final bool isAdult;
  final String description;
  final String posterPath;
  final String backgroundPath;
  final num rating;
  final String releaseDate;

  Movie({
    required this.name,
    required this.language,
    required this.isAdult,
    required this.description,
    required this.posterPath,
    required this.backgroundPath,
    required this.rating,
    required this.releaseDate,
  });

  factory Movie.fromJson(Map<String, dynamic> _json) {
    return Movie(
      name: _json['title'],
      language: _json['original_language'],
      isAdult: _json['adult'],
      description: _json['overview'],
      posterPath: _json['poster_path'],
      backgroundPath: _json['backdrop_path'],
      rating: _json['vote_average'],
      releaseDate: _json['release_date'],
    );
  }
  //

  String posterURL() {
    //
    final AppConfig _appConfig = GetIt.instance.get<AppConfig>();
    return '${_appConfig.BASE_IMAGE_API_URL}${this.posterPath}';
  }
}
