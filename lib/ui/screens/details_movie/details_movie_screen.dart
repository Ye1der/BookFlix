// ignore_for_file: unused_local_variable

import 'package:book_flix/Context.dart';
import 'package:book_flix/classes/movie.dart';
import 'package:book_flix/utils/colors/global_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';

class MovieDetails extends StatefulWidget {
  final String imgUrl;

  const MovieDetails({required this.imgUrl, super.key});

  @override
  _MovieDetails createState() => _MovieDetails();
}

class _MovieDetails extends State<MovieDetails> {
  @override
  void initState() {
    super.initState();
    print('here');
    Future.delayed(const Duration(milliseconds: 450), () {
      SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors
            .transparent, // Esto define el color de fondo de la barra de estado.
        statusBarIconBrightness:
            Brightness.light, // Cambia los iconos a blanco.
        statusBarBrightness: Brightness.dark, // Para dispositivos iOS.
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    final contextProvider = Provider.of<Context>(context);
    final Movie movie = contextProvider.movie;

    return Scaffold(
        // appBar: AppBar(
        //   backgroundColor: CustomColors.background,
        //   automaticallyImplyLeading: false,
        //   title: Container(
        //     alignment: Alignment.center,
        //     height: 45,
        //     width: 45,
        //     decoration: BoxDecoration(
        //       color: Color(0xFFE1E1E1),
        //       borderRadius: BorderRadius.circular(20)
        //     ),
        //     child: HeroIcon(HeroIcons.chevronLeft, style: HeroIconStyle.micro, size: 35)
        //   )
        // ),
        backgroundColor: CustomColors.background,
        body: Column(children: [
          Hero(
              tag: '/${widget.imgUrl}',
              child: Stack(children: [
                ClipRRect(
                    clipBehavior: Clip.hardEdge,
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30)),
                    child: Image.network(
                        'https://image.tmdb.org/t/p/w500/${widget.imgUrl}',
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover)),
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black87,
                          Colors.transparent,
                        ],
                      ),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                ),
              ])),
          Transform.translate(
            offset: const Offset(0, -150),
            child: Container(
              height: 700,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(30.0)
              )
            )
          )
        ]));
  }
}
