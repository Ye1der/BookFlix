import 'package:book_flix/Context.dart';
import 'package:book_flix/classes/movie.dart';
import 'package:book_flix/ui/screens/details_movie/details_movie_screen.dart';
import 'package:book_flix/utils/colors/global_colors.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:provider/provider.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;
  double sizeLike;
  double sizeUnLike;
  bool firstCard;

  MovieCard(
      {required this.movie,
      required this.sizeLike,
      required this.firstCard,
      required this.sizeUnLike,
      super.key});

  String _recortarTexto(String texto, int maxCaracteres) {
    if (texto.length <= maxCaracteres) {
      return texto;
    }
    return '${texto.substring(0, maxCaracteres)}...';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(60),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 20,
              spreadRadius: 0,
            )
          ]),
      child: Column(children: [
        Stack(
          // clipBehavior: Clip.hardEdge,
          alignment: Alignment.center,
          children: [
            Container(
                height: 500,
                width: 360,
                decoration: BoxDecoration(
                    color: CustomColors.background,
                    borderRadius: BorderRadius.circular(60))),
            // Imagen de fondo
            GestureDetector(
                onTap: () {
                  final contextProvider =
                      Provider.of<Context>(context, listen: false);
                  contextProvider.setMovie(movie);
                  const transitionDuration = Duration(milliseconds: 550);
                  // GoRouter.of(context).push('/movie_details${movie.img}');

                  Navigator.of(context).push(PageRouteBuilder(
                      transitionDuration: transitionDuration,
                      reverseTransitionDuration: transitionDuration,
                      pageBuilder: (_, animation, __) {
                        return FadeTransition(
                            opacity: animation,
                            child: MovieDetails(imgUrl: movie.img));
                      }));
                },
                child: Hero(
                    tag: movie.img,
                    child: Container(
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(60),
                        ),
                        child: Image.network(
                            'https://image.tmdb.org/t/p/w500/${movie.img}',
                            height: 500,
                            width: 360,
                            fit: BoxFit.cover)))),
            if (firstCard)
              Center(
                  child: Transform.translate(
                      offset: Offset(
                          (400 - sizeLike * 3.6) <= 0
                              ? 0
                              : 400 - sizeLike * 3.6,
                          0),
                      child: Transform.scale(
                          scale: (0 + sizeLike / 100) >= 1
                              ? 1
                              : (0 + sizeLike / 100),
                          child: Container(
                              alignment: Alignment.center,
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(100)),
                              child: const HeroIcon(HeroIcons.heart,
                                  size: 80,
                                  color: Colors.white,
                                  style: HeroIconStyle.micro))))),
            if (firstCard)
              Center(
                  child: Transform.translate(
                      offset: Offset(
                          (-400 + sizeUnLike * 3.6) >= 0
                              ? 0
                              : -400 + sizeUnLike * 3.6,
                          0),
                      child: Transform.scale(
                          scale: (0 + sizeUnLike / 100) >= 1
                              ? 1
                              : (0 + sizeUnLike / 100),
                          child: Container(
                              alignment: Alignment.center,
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(100)),
                              child: const HeroIcon(HeroIcons.xMark,
                                  size: 80,
                                  color: Colors.white,
                                  style: HeroIconStyle.micro))))),
          ],
        ),
        const SizedBox(height: 15),
        Hero(
            tag: '${movie.img}title',
            child: Text(movie.title,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black.withOpacity(0.7)
                ),
                softWrap: false,
                overflow: TextOverflow.visible
            )),
        const SizedBox(height: 3),
                Text('${movie.genres[0]['name']} & ${movie.genres[1]['name']}',
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.5),
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ))
      ]),
    );
  }
}
