import 'package:book_flix/classes/movie.dart';
import 'package:flutter/material.dart';

class Context extends ChangeNotifier {
  late Movie movie;

  void setMovie(Movie set) {
    movie = set;
    notifyListeners();
  }
}
