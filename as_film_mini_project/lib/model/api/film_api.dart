import 'package:dio/dio.dart';
import 'package:as_film_mini_project/utils/constants.dart';
import 'package:as_film_mini_project/model/film_model.dart';

class FilmAPI {
  final Dio _dio = Dio();

  Future<List<FilmModel>> _getFilm(String url) async {
    try {
      final response = await _dio.get(url);
      if (response.statusCode == 200) {
        final List<dynamic> results = response.data["results"];
        return results.map((film) => FilmModel.fromJson(film)).toList();
      } else {
        throw Exception("Something happened with the request, status code: ${response.statusCode}");
      }
    // ignore: deprecated_member_use
    } on DioError catch (e) {
      throw Exception("Something happened: ${e.message}");
    }
  }

  Future<List<FilmModel>> getNowPlayingFilm() async {
    const url = "https://api.themoviedb.org/3/movie/now_playing?api_key=${Constants.apiKey}";
    return _getFilm(url);
  }

  Future<List<FilmModel>> getPopularFilm() async {
    const url = "https://api.themoviedb.org/3/movie/popular?api_key=${Constants.apiKey}";
    return _getFilm(url);
  }

  Future<List<FilmModel>> getUpcomingFilm() async {
    const url = "https://api.themoviedb.org/3/movie/upcoming?api_key=${Constants.apiKey}";
    return _getFilm(url);
  }
}
