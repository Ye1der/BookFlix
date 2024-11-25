import 'package:book_flix/classes/movie.dart';
import 'package:dio/dio.dart';

const String token =
    'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2ZDQ2NmE3ZmQ5YzgzYWZlODZjNDE3MDU4Njg4MWM2ZCIsIm5iZiI6MTcyNDQyNTk5MC41NzMyMzIsInN1YiI6IjY2YzhhNGRjYjg2N2EwYWVkZGZiODI0NyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Z3FnmqNKctwwqe5l4vYagTrxAU2LY7vu_lxTqKGgDf0';

Future<dynamic> fetchMovies() async {
  final dio = Dio();
  dio.options.headers['Authorization'] = token;

  try {
    final response = await dio.get(
        'https://api.themoviedb.org/3/discover/movie?language=en-US&page=1&sort_by=popularity.desc');
    return getDetailsMovies(response.data['results']);
  } catch (e) {
    print('Error --> to get movies ${e.toString()}');
  }
}

Future<List<dynamic>> getDetailsMovies(List<dynamic> movies) async {
  final dio = Dio();
  dio.options.headers['Authorization'] = token;

  final moviesDetails = await Future.wait(movies.map((movie) async {
    try {
      final result =
          await dio.get('https://api.themoviedb.org/3/movie/${movie['id']}');
      // print(result.data);
      return result.data;
    } catch (e) {
      print('Error al obtener los detalles de la pelicula --> ${e.toString()}');
      return null;
    }
  }));

  return moviesDetails.whereType<dynamic>().toList();
}

Future<List<Movie>> getMovies() async {
  final List<dynamic> movies = await fetchMovies();

  return movies.map((movie) {
    return Movie(
        calification: movie['vote_average'],
        genres: movie['genres'],
        img: movie['poster_path'],
        overview: movie['overview'],
        relaseDate: movie['release_date'],
        runtime: movie['runtime'],
        title: movie['title']);
  }).toList();
}
