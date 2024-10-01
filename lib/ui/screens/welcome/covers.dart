import 'package:flutter/material.dart';
import 'dart:math';

class Covers extends StatelessWidget {
  const Covers({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        const SizedBox(
          width: double.infinity,
          height: 450,
        ),
        Transform.translate(
          offset: const Offset(6, 0),
          child: Container(
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color(0xBBFF6A6A),
                  spreadRadius: 0,
                  blurRadius: 500,
                )
              ]
            ),
            child: Transform.rotate(
              angle: -2 * pi / 180,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.asset('assets/img/covers/deadpool3.jpg', height: 250.0),
              )
            )
          )
        ),
        Positioned(
          right: 310,
          bottom: 20,
          child: Transform.rotate(
            angle: 12 * pi / 180,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.asset('assets/img/covers/harryPotter.jpg', height: 150.0)
            )
          )
        ),
        Positioned(
          left: 330,
          bottom: 10,
          child: Transform.rotate(
            angle: -15 * pi / 180,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.asset('assets/img/covers/nacidosBruma.jpg', height: 180.0)
            )
          )
        ),
        Positioned(
          right: 310,
          bottom: 220,
          child: Transform.rotate(
            angle: 10 * pi / 180,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.asset('assets/img/covers/titanic.jpg', height: 200.0)
            )
          )
        ),
        Positioned(
          left: 310,
          bottom: 290,
          child: Transform.rotate(
            angle: -10 * pi / 180,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.asset('assets/img/covers/theConjuring.png', height: 150.0)
            )
          )
        ),
      ]
    );
  }
}
