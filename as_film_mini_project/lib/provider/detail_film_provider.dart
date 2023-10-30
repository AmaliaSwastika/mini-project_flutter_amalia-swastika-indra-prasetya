import 'package:as_film_mini_project/model/film_model.dart';
import 'package:flutter/material.dart';

class DetailFlmProvider extends ChangeNotifier {
  late FilmModel _filmModel;

  FilmModel get filmModel => _filmModel;

  void setFilmModel(FilmModel filmModel) {
    _filmModel = filmModel;
    notifyListeners();
  }
}
