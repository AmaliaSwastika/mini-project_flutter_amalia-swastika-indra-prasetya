import 'package:as_film_mini_project/utils/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:as_film_mini_project/model/api/film_api.dart';
import 'package:as_film_mini_project/model/film_model.dart';

class FilmProvider extends ChangeNotifier {
  String _username = "";
  List<FilmModel> _nowPlayingFilm = [];
  List<FilmModel> _popularFilm = [];
  List<FilmModel> _upcomingFilm = [];

  String get username => _username;
  List<FilmModel> get nowPlayingFilm => _nowPlayingFilm;
  List<FilmModel> get popularFilm => _popularFilm;
  List<FilmModel> get upcomingFilm => _upcomingFilm;

  Future<void> fetchFilmData() async {
    _nowPlayingFilm = await FilmAPI().getNowPlayingFilm();
    _popularFilm = await FilmAPI().getPopularFilm();
    _upcomingFilm = await FilmAPI().getUpcomingFilm();
    notifyListeners();
  }

  Future<void> fetchUsername() async {
    final username = await SharedPref().getToken();
    _username = username;
    notifyListeners();
  }
}
