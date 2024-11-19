import 'dart:math';

import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';

class Buttons extends StatefulWidget {
  double scaleLike;
  double scaleUnLike;
  final void Function() onTapLike;
  final void Function() onTapUnLike;
  final void Function() onTapBack;

  Buttons(
      {required this.onTapLike,
      required this.onTapUnLike,
      required this.scaleLike,
      required this.scaleUnLike,
      required this.onTapBack,
      super.key});

  @override
  _Buttons createState() => _Buttons();
}

class _Buttons extends State<Buttons> {
  double _buttonSize = 0;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      GestureDetector(
          onTap: widget.onTapUnLike,
          child: TweenAnimationBuilder<double>(
              tween: Tween(begin: 60.0, end: 60.0 + widget.scaleUnLike / 20),
              duration: const Duration(milliseconds: 150),
              curve: Curves.linear,
              builder: (context, size, child) {
                return Container(
                    height: size,
                    width: size,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(500),
                        color: Colors.black,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              blurRadius: 20,
                              spreadRadius: 1,
                              offset: const Offset(0, 5))
                        ]),
                    child: Transform.rotate(
                        angle: -((size / 2 - 30) * pi / 180),
                        child: HeroIcon(
                          HeroIcons.xMark,
                          style: HeroIconStyle.solid,
                          size: 30.0 + (size - 60.0) * 2,
                          color: Colors.white,
                        )));
              })),
      const SizedBox(width: 30.0),
      GestureDetector(
          onTap: () {
            setState(() {
              _buttonSize = 15;
            });

            widget.onTapBack();

            Future.delayed(const Duration(milliseconds: 200), () {
              setState(() {
                _buttonSize = 0;
              });
            });
          },
          child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              height: 40 + _buttonSize,
              width: 40 + _buttonSize,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 20, 20, 90),
                  borderRadius: BorderRadius.circular(60)),
              child: const HeroIcon(HeroIcons.arrowUturnLeft,
                  color: Colors.white, style: HeroIconStyle.solid, size: 20))),
      const SizedBox(width: 30.0),
      GestureDetector(
          onTap: widget.onTapLike,
          child: TweenAnimationBuilder<double>(
              tween:
                  Tween<double>(begin: 60.0, end: 60.0 + widget.scaleLike / 20),
              duration: const Duration(milliseconds: 150),
              curve: Curves.linear,
              builder: (context, size, child) {
                return Container(
                    alignment: Alignment.center,
                    height: size,
                    width: size,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(500),
                        color: Colors.red,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.red.withOpacity(0.5),
                              blurRadius: 20,
                              spreadRadius: 1,
                              offset: const Offset(0, 5))
                        ]),
                    child: Transform.rotate(
                        angle: (size / 2 - 30) * pi / 180,
                        child: HeroIcon(HeroIcons.heart,
                            style: HeroIconStyle.micro,
                            size: 35.0 + (size - 60.0) * 1.5,
                            color: Colors.white)));
              }))
    ]);
  }
}
