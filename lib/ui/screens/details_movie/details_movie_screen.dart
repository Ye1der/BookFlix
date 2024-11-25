// ignore_for_file: unused_local_variable

import 'package:book_flix/Context.dart';
import 'package:book_flix/classes/movie.dart';
import 'package:book_flix/utils/colors/global_colors.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:provider/provider.dart';

class MovieDetails extends StatefulWidget {
  final String imgUrl;

  const MovieDetails({required this.imgUrl, super.key});

  @override
  _MovieDetails createState() => _MovieDetails();
}

class _MovieDetails extends State<MovieDetails> {
  @override
  Widget build(BuildContext context) {
    final contextProvider = Provider.of<Context>(context);
    final Movie movie = contextProvider.movie;

    return Scaffold(
        backgroundColor: CustomColors.background,
        body: Stack(children: [
          Positioned(
              top: 450,
              child: Padding(
                  padding: const EdgeInsets.only(
                    right: 20,
                    left: 20,
                  ),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height - 490,
                    child: SingleChildScrollView(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 70),
                            Text(movie.title,
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.8),
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold)),
                            const SizedBox(height: 5),
                            Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(movie.calification.toStringAsFixed(1),
                                      style: TextStyle(
                                          color: Colors.black.withOpacity(0.8),
                                          fontSize: 20,
                                          fontWeight: FontWeight.w800)),
                                  Text(' / 10',
                                      style: TextStyle(
                                          color: Colors.black.withOpacity(0.5),
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500)),
                                  const SizedBox(width: 8),
                                  const HeroIcon(HeroIcons.star,
                                      style: HeroIconStyle.micro,
                                      color: Colors.yellow),
                                  const SizedBox(width: 15),
                                  Container(
                                      height: 30,
                                      width: 1,
                                      decoration: BoxDecoration(
                                          border: Border(
                                        right: BorderSide(
                                            color: Colors.black.withOpacity(0.8),
                                            width: 2),
                                      ))),
                                  const SizedBox(width: 15),
                                  Text(
                                      '${movie.runtime ~/ 60} h ${movie.runtime - (movie.runtime ~/ 60) * 60} min',
                                      style: TextStyle(
                                          color: Colors.black.withOpacity(0.5),
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500)),
                                  const SizedBox(width: 15),
                                  Container(
                                      height: 30,
                                      width: 1,
                                      decoration: BoxDecoration(
                                          border: Border(
                                        right: BorderSide(
                                            color: Colors.black.withOpacity(0.8),
                                            width: 2),
                                      ))),
                                  const SizedBox(width: 15),
                                  Text(movie.relaseDate.substring(0, 4),
                                      style: TextStyle(
                                          color: Colors.black.withOpacity(0.5),
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500)),
                                ]),
                            const SizedBox(height: 20),
                            SizedBox(
                                width: MediaQuery.of(context).size.width - 40,
                                child: Text(movie.overview,
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(0.7),
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500))),
                            const SizedBox(height: 20),
                            Row(
                                children: [
                                  const Text('Genres: ', style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 16
                                  ))
                                ] + movie.genres.map((genre) {
                              final bool showAmpersand =
                                  movie.genres.last['name'] != genre['name'];
                              return Text('${genre['name']} ${showAmpersand ? '&' : ''} ', style: TextStyle(
                                color: Colors.black.withOpacity(0.6),
                                fontWeight: FontWeight.w500,
                                fontSize: 16
                              ));
                            }).toList()
                            )
                          ])))
                    )
                  ),
          Positioned(
            top: -100,
            child: Hero(
                tag: widget.imgUrl,
                child: ClipRRect(
                    clipBehavior: Clip.hardEdge,
                    borderRadius: BorderRadius.circular(60),
                    child: Image.network(
                        'https://image.tmdb.org/t/p/w500/${widget.imgUrl}',
                        width: MediaQuery.of(context).size.width,
                        height: 600,
                        fit: BoxFit.cover))),
          ),
        ]));
  }
}
