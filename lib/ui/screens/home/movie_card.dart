import 'dart:convert';
import 'dart:math';

import 'package:book_flix/Context.dart';
import 'package:book_flix/classes/movie.dart';
import 'package:book_flix/ui/screens/details_movie/details_movie_screen.dart';
import 'package:book_flix/utils/colors/global_colors.dart';
import 'package:book_flix/utils/widgets/FadeInText.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:heroicons/heroicons.dart';
import 'package:flutter/cupertino.dart';
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
    return Column(
        children: [
          Stack(
            clipBehavior: Clip.hardEdge,
            alignment: Alignment.bottomLeft,
            children: [
              Container(
                height: 650,
                width: 380,
                color: CustomColors.background
              ),
              // Imagen de fondo
              Hero(
                  tag: movie.img,
                  child: SizedBox(
                    height: 650,
                    width: 380,
                    child: Stack(children: [
                      Positioned.fill(
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Image.network(
                                  'https://image.tmdb.org/t/p/w500${movie.img}',
                                  fit: BoxFit.cover))),
                      // Gradiente de transparente a negro
                      Positioned.fill(
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              begin: Alignment.center,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                Colors.black,
                              ],
                            ),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                      ),
                    ]),
                  )),
              if (firstCard)
                Center(
                    child: Transform.translate(
                        offset: Offset(
                            (400 - sizeLike * 3.6) <= 0
                                ? 0
                                : 400 - sizeLike * 3.6,
                            -300),
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
                            -300),
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
              // Textos de la pelicula
              Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0, right: 15.0, bottom: 20.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Text(
                                movie.title,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.bold,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            const SizedBox(width: 20.0),
                            Text(
                              movie.calification.toString().substring(0, 3),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 5.0),
                            const HeroIcon(HeroIcons.star,
                                color: Colors.yellow,
                                style: HeroIconStyle.solid,
                                size: 21.0),
                          ],
                        ),
                        const SizedBox(height: 5.0),
                        Text(_recortarTexto(movie.overview, 150),
                                style: const TextStyle(
                                    color: Color.fromARGB(220, 255, 255, 255),
                                    fontWeight: FontWeight.bold))
                      ])),
              // Evento de click de la pelicula
              GestureDetector(
                  onTap: () {
                    final contextProvider = Provider.of<Context>(context, listen: false);
                    contextProvider.setMovie(movie);
                    GoRouter.of(context).push('/movie_details${movie.img}');
                  },
                  child: Container(
                    width: 380,
                    height: 650,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ))
            ],
          ),
        ],
    );
  }
}
