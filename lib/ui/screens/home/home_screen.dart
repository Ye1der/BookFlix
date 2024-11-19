import 'package:book_flix/ui/screens/home/swiper_cards.dart';
import 'package:book_flix/utils/colors/global_colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:heroicons/heroicons.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CustomColors.background,
        appBar: AppBar(
            backgroundColor: CustomColors.background,
            automaticallyImplyLeading: false,
            toolbarHeight: 50.0,
            title:
                Row(
                  children: [
                    ClipOval(
                      child: Image.network('https://i.pinimg.com/564x/53/d5/8d/53d58d6c149903e8f06e68065ff7e628.jpg',
                        width: 45.0, height: 45.0)
                    ),
                    const SizedBox(width: 10.0),
                    const Text('Yeider', style: TextStyle(
                      fontWeight: FontWeight.bold
                    ))
                  ]
                ),
            actions: [
              GestureDetector(
                  onTap: () {
                    GoRouter.of(context).push('/favorites');
                  },
                  child: const Icon(Icons.favorite,
                      size: 30.0, color: CustomColors.red)),
            ]
        ),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Swiper()
              ])));
  }
}
