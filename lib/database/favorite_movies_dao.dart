import 'dart:convert';

import 'package:book_flix/classes/movie.dart';
import 'package:book_flix/database/database_helper.dart';

class FavoriteMoviesDao {
  final db = DatabaseHelper.instance.db;

  Future<List<Movie>> getAll() async {
    final data = await db.query('favoriteMovies');
    return data.map((e) {
      final Map<String, dynamic> movie = e;
      return Movie(
        calification: movie['calification'],
        title: movie['title'],
        overview: movie['overview'],
        img: movie['img'],
        relaseDate: movie['relaseDate'],
        runtime: movie['runtime'],
        genres: (() {
          try {
            return jsonDecode(movie['genres']);
          } catch (e) {
            return [];
          }
        })(),
      );
    }).toList();
  }

  Future<int> insert(Movie movie) async {
    final alreadyExists = await db
        .query('favoriteMovies', where: 'title = ?', whereArgs: [movie.title]);

    if (alreadyExists.isNotEmpty) {
      print('Movie already exist in the database, omiting action');
      return -1;
    }

    return await db.insert('favoriteMovies', {
      'calification': movie.calification,
      'title': movie.title,
      'overview': movie.overview,
      'img': movie.img,
      'relaseDate': movie.relaseDate,
      'runtime': movie.runtime,
      'genres': jsonEncode(movie.genres)
    });
  }
}
