import 'dart:math';

import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:book_flix/classes/movie.dart';
import 'package:book_flix/ui/screens/home/buttons.dart';
import 'package:book_flix/ui/skeletons/movie_card_skeleton.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import './movie_card.dart';

class Swiper extends StatefulWidget {
  Swiper({super.key});

  @override
  _Swiper createState() => _Swiper();
}

class _Swiper extends State<Swiper> with SingleTickerProviderStateMixin {
  final AppinioSwiperController swiperController = AppinioSwiperController();
  List<dynamic> _movies = [];

  double _sizeLike = 0.0;
  double _sizeUnLike = 0.0;

  int indexFirst = 0; // Señala el index de la tarjeta que esta visible

  // Peticion de peliculas
  Future<dynamic> _fetchMovies() async {
    final dio = Dio();
    dio.options.headers['Authorization'] =
        'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2ZDQ2NmE3ZmQ5YzgzYWZlODZjNDE3MDU4Njg4MWM2ZCIsIm5iZiI6MTcyNDQyNTk5MC41NzMyMzIsInN1YiI6IjY2YzhhNGRjYjg2N2EwYWVkZGZiODI0NyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Z3FnmqNKctwwqe5l4vYagTrxAU2LY7vu_lxTqKGgDf0';

    try {
      final response = await dio.get(
          'https://api.themoviedb.org/3/discover/movie?language=en-US&page=1&sort_by=popularity.desc');
      setState(() {
        _movies = response.data['results'];
      });
    } catch (e) {
      print('Error --> to get movies ${e.toString()}');
    }
  }

  @override
  void initState() {
    // Inicia el estado del widget y hace la peiticion de peliculas
    super.initState();
    _fetchMovies();
  }

  // Callback que se llama cuando se termina un swipe
  void _handleSwipeEnd(int _, int __, SwiperActivity swiperActivity) {
    setState(() {
      _sizeLike = 0;
      _sizeUnLike = 0;
    });

    if (swiperActivity.end?.dx == 0.0)
      return; // si no se completa el swipe no se termina de ejecutar la función

    if (swiperActivity.direction.name == 'right') {
      print('derecha');
    }

    setState(() {
      indexFirst++;
    });
  }

  // Toma las coordenadas en x de la tarjeta cuando se desliza y las pone en una variable
  void _swiperPosition(SwiperPosition position) {
    if (position.offset.dx >= 0) {
      _sizeLike = position.offset.dx;
    } else {
      _sizeUnLike = position.offset.dx * -1;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
          height: 650,
          width: 380,
          child: Stack(children: [
            if (_movies.isNotEmpty)
              AppinioSwiper(
                  controller: swiperController,
                  backgroundCardOffset: Offset.zero,
                  backgroundCardScale: 0.8,
                  swipeOptions:
                      const SwipeOptions.only(left: true, right: true),
                  invertAngleOnBottomDrag: false,
                  onSwipeEnd: _handleSwipeEnd,
                  onCardPositionChanged: _swiperPosition,
                  cardCount: _movies.length - 1,
                  cardBuilder: (BuildContext context, int index) {
                    final movie = _movies[index];

                    return MovieCard(
                      movie: Movie(
                        calification: movie['vote_average'],
                        title: movie['title'],
                        overview: movie['overview'],
                        img: movie['poster_path'],
                      ),
                      firstCard: indexFirst == index,
                      sizeLike: _sizeLike,
                      sizeUnLike: _sizeUnLike,
                    );
                  }),
            if (_movies.isEmpty) MovieCardSkeleton()
          ])),
      const SizedBox(height: 20.0),
      Buttons(
          onTapLike: () {
            _sizeLike = 200;
            setState(() {});
            swiperController.swipeRight();
          },
          onTapUnLike: () {
            _sizeUnLike = 200;
            setState(() {});
            swiperController.swipeLeft();
          },
          onTapBack: () {
            swiperController.unswipe();
            if (indexFirst > 0) indexFirst--;
          },
          scaleLike: _sizeLike,
          scaleUnLike: _sizeUnLike)
    ]);
  }
}
