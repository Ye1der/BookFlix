import 'package:book_flix/Context.dart';
import 'package:book_flix/classes/movie.dart';
import 'package:book_flix/database/favorite_movies_dao.dart';
import 'package:book_flix/ui/screens/details_movie/details_movie_screen.dart';
import 'package:book_flix/utils/colors/global_colors.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:provider/provider.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  List<Movie> favoriteMovies = [];
  final moviesDao = FavoriteMoviesDao();

  @override
  void initState() {
    super.initState();
    setFavoriteMovies();
  }

  void setFavoriteMovies() async {
    final movies = await moviesDao.getAll();
    favoriteMovies = movies;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CustomColors.background,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: CustomColors.background,
          title: Text('Favorites',
              style: TextStyle(
                  color: Colors.black.withOpacity(0.8),
                  fontSize: 40,
                  fontWeight: FontWeight.w900)),
        ),
        body: Padding(
            padding: const EdgeInsets.only(
              left: 15,
              right: 15,
              top: 20,
            ),
            child: favoriteMovies.isEmpty
                ? Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        HeroIcon(HeroIcons.square2Stack,
                            style: HeroIconStyle.solid,
                            size: 100,
                            color: Colors.black.withOpacity(0.4)),
                        Text('Your favorite movies \n will be here',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black.withOpacity(0.4)))
                      ]))
                : SingleChildScrollView(
                    child: Column(
                        children: favoriteMovies
                            .map((movie) => _CardMovie(movie: movie))
                            .toList() as List<Widget>))));
  }
}

class _CardMovie extends StatelessWidget {
  final Movie movie;

  const _CardMovie({super.key, required this.movie});

  void goDetails(BuildContext context) {
    final contextProvider = Provider.of<Context>(context, listen: false);
    contextProvider.setMovie(movie);
    const transitionDuration = Duration(milliseconds: 550);
    // GoRouter.of(context).push('/movie_details${movie.img}');

    Navigator.of(context).push(PageRouteBuilder(
        transitionDuration: transitionDuration,
        reverseTransitionDuration: transitionDuration,
        pageBuilder: (_, animation, __) {
          return FadeTransition(
            opacity: animation, child: MovieDetails(imgUrl: movie.img, imageHeroTag: 'fav${movie.img}'));
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(bottom: 20),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          GestureDetector(
              onTap: () {
                goDetails(context);
              },
              child: Hero(
                tag: 'fav${movie.img}',
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                          'https://image.tmdb.org/t/p/w500/${movie.img}',
                          fit: BoxFit.cover,
                          height: 200)))),
          const SizedBox(width: 15),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
                width: MediaQuery.of(context).size.width - 185,
                child: Text(movie.title,
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.9),
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis)),
            const SizedBox(height: 10),
            SizedBox(
                width: MediaQuery.of(context).size.width - 185,
                child: Text(
                  movie.overview,
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.6),
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                )),
            const SizedBox(height: 10),
            Row(children: [
              HeroIcon(HeroIcons.clock,
                  style: HeroIconStyle.micro,
                  color: Colors.black.withOpacity(0.6),
                  size: 18),
              const SizedBox(width: 5),
              Text(
                  '${movie.runtime ~/ 60} h ${movie.runtime - (movie.runtime ~/ 60) * 60} min',
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.6),
                      fontSize: 18,
                      fontWeight: FontWeight.w500))
            ])
          ])
        ]));
  }
}
