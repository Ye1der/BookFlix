import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Cards extends StatelessWidget {
  Cards({super.key});

  final colors = [Colors.red, Colors.blue, Colors.yellow];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Center(
                child: Container(
                    height: 300,
                    width: 200,
                    child: AppinioSwiper(
                        backgroundCardOffset: Offset.zero,
                        backgroundCardScale: 0.8,
                        swipeOptions:
                            const SwipeOptions.only(left: true, right: true),
                        onSwipeEnd: (_, __, swiperActivity) {
                          if (swiperActivity.direction.name == 'right') {
                            print('se movio a la derecha');
                          } else {
                            print('se movio a la izquierda');
                          }
                        },
                        cardCount: 3,
                        cardBuilder: (BuildContext context, int index) {
                          return Container(color: colors[index]);
                        })))));
  }
}
