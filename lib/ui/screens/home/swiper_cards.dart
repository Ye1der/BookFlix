import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:book_flix/utils/widgets/custom_button.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:lucide_icons/lucide_icons.dart';

class Swiper extends StatefulWidget {
  Swiper({super.key});

  @override
  _Swiper createState() => _Swiper();
}

class _Swiper extends State<Swiper> {
  final AppinioSwiperController swiperController = AppinioSwiperController();
  List<dynamic> _movies = [];

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
    super.initState();
    _fetchMovies();
  }

  void _handleSwipe(int _, int __, SwiperActivity swiperActivity) {
    if (swiperActivity.direction.name == 'right') {
      print('se movio a la derecha');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      if (_movies.isNotEmpty)
        Container(
            height: 700,
            width: 350,
            child: AppinioSwiper(
                controller: swiperController,
                backgroundCardOffset: Offset.zero,
                backgroundCardScale: 0.8,
                swipeOptions: const SwipeOptions.only(left: true, right: true),
                onSwipeEnd: _handleSwipe,
                cardCount: _movies.length - 1,
                cardBuilder: (BuildContext context, int index) {
                  final movie = _movies[index];

                  return Card(
                      calification: movie['vote_average'],
                      title: movie['title'],
                      overview: movie['overview'],
                      img: movie['poster_path']);
                }))
    ]);
  }
}

class Card extends StatelessWidget {
  final String title;
  final String overview;
  final String img;
  final double calification;

  const Card(
      {required this.img,
      required this.overview,
      required this.calification,
      required this.title,
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
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 15.0
          )
        ]
      ),
      child: Column(children: [
        Container(
          height: 550,
          width: 350,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage('https://image.tmdb.org/t/p/w500/$img'),
                  fit: BoxFit.cover),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              )),
        ),
        Container(
            alignment: Alignment.topLeft,
            height: 150,
            width: 350,
            padding: const EdgeInsets.all(10.0),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0))),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(title,
                      style: const TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 5.0),
                  Text(_recortarTexto(overview, 100),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black54)),
                  const SizedBox(height: 5.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(calification.toString(), style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0
                      )),
                      Icon(Icons.star, color: Colors.yellow)
                    ]
                  )
                ]))
      ])
    );
  }
}
